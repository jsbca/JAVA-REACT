import React from "react";

const stackItems = [
  {
    title: "React Frontend",
    description: "Fast client UI for dashboards, forms, and product flows.",
  },
  {
    title: "Spring Boot Backend",
    description: "Solid API layer for business logic, auth, and data access.",
  },
  {
    title: "Same-Port Delivery",
    description: "Frontend build is served by Spring Boot on `localhost:8080`.",
  },
];

const highlights = [
  "Single-port local preview",
  "Ready for API-first development",
  "Clean split between UI and backend",
  "Easy to expand into a real product",
];

const launchSteps = [
  "Build the React app into Spring Boot static assets.",
  "Start the backend and serve everything from port 8080.",
  "Grow the homepage into a dashboard, portal, or admin app.",
];

export default function App() {
  return (
    <div className="page-shell">
      <div className="ambient ambient-left" />
      <div className="ambient ambient-right" />

      <main className="page">
        <section className="hero">
          <div className="hero-copy">
            <p className="eyebrow">Java + React fullstack starter</p>
            <h1>Build one polished app experience on a single local port.</h1>
            <p className="hero-text">
              This starter keeps the frontend and backend nicely separated in the
              codebase, while serving them together as one smooth product
              experience from Spring Boot.
            </p>

            <div className="hero-actions">
              <a className="primary-action" href="#setup">
                View setup flow
              </a>
              <a className="secondary-action" href="#stack">
                Explore stack
              </a>
            </div>

            <ul className="highlight-list">
              {highlights.map((item) => (
                <li key={item}>{item}</li>
              ))}
            </ul>
          </div>

          <aside className="hero-panel">
            <div className="status-card">
              <span className="status-pill">Live preview target</span>
              <strong>http://localhost:8080</strong>
              <p>
                React builds into the backend static folder, and Spring Boot
                serves the homepage from the same origin.
              </p>
            </div>

            <div className="metric-grid">
              <div className="metric-card">
                <span>Frontend</span>
                <strong>React + Vite</strong>
              </div>
              <div className="metric-card">
                <span>Backend</span>
                <strong>Spring Boot</strong>
              </div>
              <div className="metric-card">
                <span>Delivery</span>
                <strong>Single port</strong>
              </div>
              <div className="metric-card">
                <span>Java</span>
                <strong>17</strong>
              </div>
            </div>
          </aside>
        </section>

        <section className="content-grid" id="stack">
          <div className="section-heading">
            <p className="eyebrow">Stack overview</p>
            <h2>Everything is laid out so we can move fast without making a mess.</h2>
          </div>

          <div className="card-grid">
            {stackItems.map((item) => (
              <article className="info-card" key={item.title}>
                <h3>{item.title}</h3>
                <p>{item.description}</p>
              </article>
            ))}
          </div>
        </section>

        <section className="setup-section" id="setup">
          <div className="setup-copy">
            <p className="eyebrow">How it runs</p>
            <h2>One command flow for a unified homepage.</h2>
            <p>
              The frontend is bundled first, then the backend serves that output.
              This gives you a clean local experience that feels like one app,
              not two disconnected dev servers.
            </p>
          </div>

          <div className="timeline">
            {launchSteps.map((step, index) => (
              <div className="timeline-step" key={step}>
                <span className="timeline-index">0{index + 1}</span>
                <p>{step}</p>
              </div>
            ))}
          </div>
        </section>

        <section className="cta-banner">
          <div>
            <p className="eyebrow">Next milestone</p>
            <h2>Ready to add APIs, auth, dashboards, or real business workflows.</h2>
          </div>
          <a className="primary-action" href="#stack">
            Start building
          </a>
        </section>
      </main>
    </div>
  );
}
