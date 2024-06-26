uniform float uTime;
uniform vec3 uColor;

varying vec3 vPosition;
varying vec3 vNormal;

void main() {
    float stripes = mod((vPosition.y - uTime * 0.02) * 20.0, 1.0);
    stripes = pow(stripes, 3.0);

    vec3 viewDirection = normalize(vPosition - cameraPosition);
    vec3 normal = normalize(vNormal);
    if(!gl_FrontFacing){
        normal *= -1.0;
    }

    float fresnel = dot(viewDirection, normal) + 1.0;
    fresnel = pow(fresnel, 2.0);

    float falloff = smoothstep(0.8, 0.0, fresnel);

    float holo = stripes * fresnel;
    holo += fresnel * 1.25;
    holo *= falloff;

    gl_FragColor = vec4(uColor, holo);
    #include <tonemapping_fragment>
    #include <colorspace_fragment>
}