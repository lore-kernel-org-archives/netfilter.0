From: "G.W. Haywood" <ged@jubileegroup.co.uk>
Subject: Re: Limiting httpd traffic
Date: Sat, 5 Jan 2008 11:57:51 +0000 (GMT)
Message-ID: <Pine.LNX.4.58.0801051156340.32055@mail3.jubileegroup.co.uk>
References: <20080105022544.99knia1nqesgkw48@webmail.sabanciuniv.edu>
 <Pine.LNX.4.58.0801051108580.32055@mail3.jubileegroup.co.uk>
 <20080105135010.35aw2zq1biroogg8@webmail.sabanciuniv.edu>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20080105135010.35aw2zq1biroogg8@webmail.sabanciuniv.edu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi there,

On Sat, 5 Jan 2008, Umut Arus wrote:

> >> We want to limiting httpd outgoing traffic in a proxy server,
>
> I mean that "http outgoing traffic". rapidshare connections and as
> getright download manager softwares are exploited our bandwith. I want
> to limit connection per web-site and per-source IP's.
> I hope so, I would explain more clearly

Type

man iptables

look for 'hashlimit'

Is that what you want?

--

73,
Ged.
