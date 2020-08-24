From: Thomas Luening <toml@thlu.de>
Subject: Re: Explanation of 2 Rules
Date: Mon, 24 Aug 2020 11:39:14 +0200
Message-ID: <96ccc7de-4de4-e01f-2270-a1238b4cff1a@mail>
References: <416b36ac-c17f-0ccd-3d28-cf8e4f3372ae@mail>
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <416b36ac-c17f-0ccd-3d28-cf8e4f3372ae@mail>
Content-Language: de-DE
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi David,

Am 22.08.20 um 21:12 schrieb david@hajes.org:
 > why don't you simplify and just DROP INVALID?
 >
 > INVALID drops any possible incorrect combination. You don't need to write anymore as in iptables

thank you for your answer, but that makes it a little more complicated for me now. Now my question has 2 aspects.

The first one is still the syntax question. Detached from the logic (invalid) I would still like to know if I interpreted the 
syntax of the statement correctly.

The second (new) aspect is the ct-state "invalid". To help, I looked at 4 presentations by F. Westphal, 1 by P. Ayuso, 1 by R. 
Spenneberg, plus man-pages and lots of web sites. In fact, I can't find any better explanation of what marks a package as 
invalid than in linuxtopia:

https://www.linuxtopia.org/Linux_Firewall_iptables/x1347.html
"The INVALID state means that the packet can't be identified or that it does not have any state. This may be due to several 
reasons, such as the system running out of memory or ICMP error messages that do not respond to any known connections. 
Generally, it is a good idea to DROP everything in this state."

Well, why is an xmas packet invalid, if it can be identified and has a status (even several, depending on the view/query).

BTW, I've been using "invalid" for a long time, but at the moment I can't find out if "state invalid" actually marks xmas packages.

Best Regards, Tom
