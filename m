From: "TinyApps.Org" <miles@tinyapps.org>
Subject: iptables: limiting bytes downloaded per IP per day?
Date: Wed, 27 Jun 2012 09:58:22 -1000
Message-ID: <4FA23E53-0A2D-4191-8810-F14D4F3D1740@tinyapps.org>
Mime-Version: 1.0 (Apple Message framework v1084)
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On a public-facing web server, I'd like to limit the total bytes
downloaded per IP address per day. For example, after a visitor
downloaded 100MB, any additional requests would be dropped or
rejected for the next 24 hours. Is it possible to accomplish
this using iptables alone?
