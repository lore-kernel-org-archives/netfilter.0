From: "G.W. Haywood" <ged@jubileegroup.co.uk>
Subject: Re: Can't set up transparent proxy on XO laptop
Date: Sun, 13 Jan 2008 22:44:22 +0000 (GMT)
Message-ID: <Pine.LNX.4.58.0801132243230.5870@mail3.jubileegroup.co.uk>
References: <25397.63399.qm@web51912.mail.re2.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <25397.63399.qm@web51912.mail.re2.yahoo.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi there,

On Sun, 13 Jan 2008, P Zemlja wrote:

> I'm trying to set up internet filtering...
> ...
> bash-3.2# /sbin/iptables -t nat -A OUTPUT -p tcp

Don't filter in the nat table.

http://iptables-tutorial.frozentux.net/

--

73,
Ged.
