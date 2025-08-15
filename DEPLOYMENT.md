# Deployment Guide

This guide provides multiple options for deploying the DevDominic portfolio website.

## 🌐 GitHub Pages (Recommended)

GitHub Pages is the easiest way to deploy this portfolio since it's already hosted on GitHub.

### Setup Steps:
1. **Go to Repository Settings**
   - Navigate to your GitHub repository
   - Click on "Settings" tab

2. **Enable GitHub Pages**
   - Scroll down to "Pages" section
   - Under "Source", select "Deploy from a branch"
   - Choose "main" branch
   - Select "/ (root)" folder
   - Click "Save"

3. **Access Your Site**
   - Your portfolio will be available at: `https://dominictalbot.github.io/DevDominic`
   - Updates automatically deploy when you push to main branch

### Custom Domain (Optional):
- Add a `CNAME` file with your domain name
- Configure DNS settings with your domain provider
- Update GitHub Pages settings to use custom domain

## 🚀 Netlify

Netlify offers excellent performance and features for static sites.

### Quick Deploy:
1. **Connect Repository**
   - Go to [Netlify](https://netlify.com)
   - Click "New site from Git"
   - Connect your GitHub account
   - Select the DevDominic repository

2. **Configure Build Settings**
   - Build command: `npm run build` (or leave empty)
   - Publish directory: `.` (root)
   - Click "Deploy site"

3. **Custom Domain**
   - Go to Site settings → Domain management
   - Add custom domain
   - Follow DNS configuration instructions

### Netlify Features:
- Automatic HTTPS
- Global CDN
- Form handling
- Branch previews
- Environment variables

## ⚡ Vercel

Vercel provides fast deployment with excellent performance optimization.

### Deploy Steps:
1. **Import Project**
   - Go to [Vercel](https://vercel.com)
   - Click "New Project"
   - Import from GitHub
   - Select DevDominic repository

2. **Configure Settings**
   - Framework Preset: Other
   - Root Directory: ./
   - Build Command: (leave empty or `npm run build`)
   - Output Directory: ./

3. **Deploy**
   - Click "Deploy"
   - Your site will be live with a vercel.app URL

### Vercel Features:
- Edge functions
- Analytics
- Performance insights
- Automatic HTTPS
- Global CDN

## 🔥 Firebase Hosting

Firebase offers robust hosting with Google's infrastructure.

### Setup:
1. **Install Firebase CLI**
   ```bash
   npm install -g firebase-tools
   ```

2. **Initialize Project**
   ```bash
   firebase login
   firebase init hosting
   ```

3. **Configure firebase.json**
   ```json
   {
     "hosting": {
       "public": ".",
       "ignore": [
         "firebase.json",
         "**/.*",
         "**/node_modules/**"
       ],
       "rewrites": [
         {
           "source": "**",
           "destination": "/index.html"
         }
       ]
     }
   }
   ```

4. **Deploy**
   ```bash
   firebase deploy
   ```

## ☁️ AWS S3 + CloudFront

For enterprise-level hosting with AWS services.

### Setup Process:
1. **Create S3 Bucket**
   - Name bucket (e.g., dominic-portfolio)
   - Enable static website hosting
   - Set index document to index.html

2. **Upload Files**
   ```bash
   aws s3 sync . s3://your-bucket-name --exclude ".*" --exclude "node_modules/*"
   ```

3. **Configure CloudFront**
   - Create distribution
   - Set origin to S3 bucket
   - Configure SSL certificate
   - Set up custom domain

4. **Set Bucket Policy**
   ```json
   {
     "Version": "2012-10-17",
     "Statement": [
       {
         "Sid": "PublicReadGetObject",
         "Effect": "Allow",
         "Principal": "*",
         "Action": "s3:GetObject",
         "Resource": "arn:aws:s3:::your-bucket-name/*"
       }
     ]
   }
   ```

## 🌊 Surge.sh

Simple command-line deployment for static sites.

### Quick Deploy:
1. **Install Surge**
   ```bash
   npm install -g surge
   ```

2. **Deploy**
   ```bash
   surge
   ```

3. **Follow Prompts**
   - Select project folder
   - Choose domain name
   - Deploy instantly

## 🔧 Performance Optimization

### Pre-deployment Checklist:
- [ ] Optimize images (compress, convert to WebP)
- [ ] Minify CSS and JavaScript
- [ ] Enable compression (gzip/brotli)
- [ ] Test mobile responsiveness
- [ ] Validate HTML/CSS
- [ ] Check accessibility compliance
- [ ] Test loading speed
- [ ] Verify all links work
- [ ] Test contact form functionality

### Tools for Optimization:
- **Image Compression**: TinyPNG, ImageOptim
- **Code Minification**: UglifyJS, Clean-CSS
- **Performance Testing**: Google PageSpeed Insights, GTmetrix
- **Accessibility**: WAVE, Lighthouse

## 📊 Analytics Setup

### Google Analytics:
1. Create Google Analytics account
2. Add tracking code to index.html
3. Set up goals and conversions

### Other Analytics Options:
- Plausible (privacy-focused)
- Fathom Analytics
- Simple Analytics

## 🔐 Security Headers

Add security headers for production deployment:

```html
<!-- Add to <head> section -->
<meta http-equiv="X-Content-Type-Options" content="nosniff">
<meta http-equiv="X-Frame-Options" content="DENY">
<meta http-equiv="X-XSS-Protection" content="1; mode=block">
<meta http-equiv="Strict-Transport-Security" content="max-age=31536000">
```

## 🚨 Troubleshooting

### Common Issues:
1. **External CDN blocked**: Download and host libraries locally
2. **HTTPS mixed content**: Ensure all resources use HTTPS
3. **Mobile layout issues**: Test on various device sizes
4. **Slow loading**: Optimize images and minify code
5. **Contact form not working**: Set up backend service or form handler

### Support Resources:
- GitHub Issues for repository-specific problems
- Platform documentation (Netlify, Vercel, etc.)
- Web development communities (Stack Overflow, Reddit)

---

Choose the deployment method that best fits your needs. GitHub Pages is recommended for simplicity, while Netlify or Vercel offer more advanced features for professional deployment.