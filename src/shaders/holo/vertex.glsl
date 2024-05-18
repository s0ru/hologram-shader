varying vec3 vPosition;
varying vec3 vNormal;

void main(){
    vec4 modelPosition = modelMatrix * vec4(position, 1.0);
    vPosition = modelPosition.xyz;

    vec4 modelNormal = modelMatrix * vec4(normal, 0.0);
    vNormal = modelNormal.xyz;

    gl_Position = projectionMatrix * viewMatrix * modelPosition;
}