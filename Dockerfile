FROM apify/actor-node:16
FROM apify/actor-node-playwright-chrome:16
FROM apify/actor-node-puppeteer-chrome:16



# Install default dependencies, print versions of everything
RUN npm --quiet set progress=false \
 && npm install --only=prod --no-optional \
 && echo "Installed NPM packages:" \
 && (npm list || true) \
 && echo "Node.js version:" \
 && node --version \
 && echo "NPM version:" \
 && npm --version

ENV APIFY_DISABLE_OUTDATED_WARNING 1

# Copy source code
COPY . ./
