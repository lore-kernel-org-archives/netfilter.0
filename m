From: "G.W. Haywood" <ged@jubileegroup.co.uk>
Subject: Re: Filtering bad http requests
Date: Fri, 18 Jan 2008 08:34:09 +0000 (GMT)
Message-ID: <Pine.LNX.4.58.0801180820430.4651@mail3.jubileegroup.co.uk>
References: <478FDA5E.6050908@alumni.uwaterloo.ca>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <478FDA5E.6050908@alumni.uwaterloo.ca>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi there,

On Fri, 18 Jan 2008, Mike Leahy wrote:

> I'm wondering if anyone knows of a simple way to filter out bad HTTP
> requests being sent to my server.

I don't think it's simple.  There are many sneaky exploiters Out
There.  We use scripts which tail the Apache logs (via syslog-ng)
looking for suspicious activity.  The definition of 'suspicious' is
wide, fluid and contained in a database which also records actions
taken by the scripts.  We only use iptables at the back end of this
system, the parameters for blocking are controlled by the scripts.

> I've iptables setup to do this sort of thing with brute force ssh
> login attempts.

I wonder if there's a need to accept ssh connections at all from most
of the IPs that you see attacking you; my boxes accept ssh connections
permanently from only two or three known IPs.  We see no brute force
attacks whatever, as an IP just can't connect if it isn't known to us.
We implemented a form of port knocking for mobile users.

--

73,
Ged.
