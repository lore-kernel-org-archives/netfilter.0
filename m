From: "Eric Jacobs" <ejacobs@thomaspublishing.com>
Subject: Using X-Forwarded-For
Date: Mon, 17 Aug 2009 16:20:01 -0400
Message-ID: <h6ce23$fks$1@ger.gmane.org>
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Management wanted an extra layer of security for some financial apps. Idea 
was to set up reverse proxy server which required authentication. This 
seemed to work until I tried to set up iptables to restrict access only from 
proxy server. Turns out there are applets downloaded to user's machine that 
try to connect directly to apps server.
So I thought maybe I could do something in IPTABLES with the 
"X-Forwarded-For" header from the proxy server. Is this possible? 



