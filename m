From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: viewing rules and traffic while inserting/removing rules
Date: Thu, 08 May 2008 11:44:07 -0500
Message-ID: <48232DD7.3070603@riverviewtech.net>
References: <4821E655.4010504@roth.lu> <090801c8b07c$fa084b60$5000040a@skathlaptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <090801c8b07c$fa084b60$5000040a@skathlaptop>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 05/07/08 15:01, Steven Kath wrote:
> Have you considered using netfilter's ip sets for this?  Sounds like 
> it might be perfect for your needs.

With out knowing how or what the OP is accounting we don't know if s/he 
is looking at each individual network that is being filtered or if it is 
clients behind the system.  If it is networks that are being filtered I 
would think that the single ipset rule would make it much harder, if not 
impossible, to keep accounting data for a single rule.



Grant. . . .
