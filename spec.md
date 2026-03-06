# Cooked Resume

## Current State
New project — no existing code.

## Requested Changes (Diff)

### Add
- Full landing page for "Cooked Resume" resume optimization service
- Dark futuristic design with black background, neon green and electric orange accents
- Scroll-driven 3D background using Three.js / React Three Fiber with floating resume cards, scanning beam, particle system, and digital grid
- Hero section: bold headline, emotional subheading, two CTAs, animated resume mockup, trust badges
- Problem section: 4 cards explaining why resumes get rejected
- Solution section: features list + before/after resume comparison visual
- How It Works: 3-step process with icons
- Social proof: 3 testimonial cards + stat callouts
- Pricing: 2-tier cards (Basic ₹499, Pro ₹999) with feature lists and CTAs
- FAQ: 5 accordion items
- Final CTA section with bold closing line and main CTA button
- Footer with links and social icons
- Smooth scroll animations (Intersection Observer / Framer Motion style)
- Mobile responsive layout

### Modify
- N/A (new project)

### Remove
- N/A (new project)

## Implementation Plan
1. Select no special Caffeine components (static landing page, no auth/payment integration at backend level)
2. Generate minimal Motoko backend (contact/waitlist form submission store)
3. Build React frontend:
   - Install Three.js + @react-three/fiber + @react-three/drei for 3D background
   - Create ScrollDrivenBackground component: floating resume meshes, scanning beam, particle field, digital grid floor
   - Build each section as its own component with scroll-triggered fade/slide animations
   - Apply OKLCH-based design tokens with neon green (#39FF14 equivalent) and orange highlights
   - Inter/Poppins-style font via Tailwind
   - Glassmorphism cards, rounded corners, subtle shadows
   - Mobile-first responsive grid layouts
   - All interactive CTAs have data-ocid markers
