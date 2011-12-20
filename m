From: "Hansa" <mythtv@logic-q.nl>
Subject: Is the current firewall model static?
Date: Tue, 20 Dec 2011 10:25:18 +0100
Message-ID: <000301ccbef9$4a8dc180$dfa94480$@nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: nl
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi there,

Fedora is running a project called firewalld. Firewalld manages the firewall
dynamically via D-BUS
(http://fedoraproject.org/wiki/FirewallD/#Why_A_Firewall_Daemon). They say:
"the current firewall model is static and **every** change requires a
complete firewall restart. This includes also to unload the firewall
netfilter kernel modules and to load the modules that are needed for the new
configuration."

I would be very surprised if their claim is true. Because that would break
statefull connections when changing the rules. I'm not familiar with the
code so I can't comment on that. Hence my question. Is the current firewall
model static?

Best regards,

-Hansa



