// generate-icons.js - run with: node generate-icons.js
const { createCanvas } = require('canvas')
const fs = require('fs')

function generateIcon(size) {
    const canvas = createCanvas(size, size)
    const ctx = canvas.getContext('2d')

    // Background
    const gradient = ctx.createLinearGradient(0, 0, size, size)
    gradient.addColorStop(0, '#064e3b')
    gradient.addColorStop(1, '#10b981')
    ctx.fillStyle = gradient
    ctx.roundRect(0, 0, size, size, size * 0.22)
    ctx.fill()

    // Emoji
    ctx.textAlign = 'center'
    ctx.textBaseline = 'middle'
    ctx.font = `${size * 0.5}px serif`
    ctx.fillText('🌿', size / 2, size / 2)

    return canvas.toBuffer('image/png')
}

try {
    const sizes = [192, 512]
    sizes.forEach(size => {
        const buf = generateIcon(size)
        fs.writeFileSync(`public/icon-${size}.png`, buf)
        console.log(`✅ icon-${size}.png gerado`)
    })
} catch (e) {
    // canvas não disponível, criar placeholder SVG-based icon
    console.log('canvas não disponível, criando ícones SVG placeholder...')

    const svgIcon = (size) => `<svg xmlns="http://www.w3.org/2000/svg" width="${size}" height="${size}" viewBox="0 0 ${size} ${size}">
  <defs>
    <linearGradient id="g" x1="0" y1="0" x2="1" y2="1">
      <stop offset="0" stop-color="#064e3b"/>
      <stop offset="1" stop-color="#10b981"/>
    </linearGradient>
  </defs>
  <rect width="${size}" height="${size}" rx="${size * 0.22}" fill="url(#g)"/>
  <text x="${size / 2}" y="${size / 2 + ${ size* 0.18
}}" font-size="${ size * 0.5 } " text-anchor="middle" font-family="serif">🌿</text>
</svg > `

  // Usar PNG mínimo válido como fallback
  const minimalPng192 = Buffer.from(
    'iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mNk+M9QDwADhgGAWjR9awAAAABJRU5ErkJggg==',
    'base64'
  )
  
  if (!fs.existsSync('public/icon-192.png')) {
    fs.writeFileSync('public/icon-192.png', minimalPng192)
    console.log('✅ icon-192.png (placeholder)')
  }
  if (!fs.existsSync('public/icon-512.png')) {
    fs.writeFileSync('public/icon-512.png', minimalPng192)
    console.log('✅ icon-512.png (placeholder)')
  }
}
