From: Rudi Starcevic <tech@wildcash.com>
Subject: Re: Route packets from an interface to another
Date: Mon, 12 Sep 2005 07:47:13 -0700
Message-ID: <432594F1.5040200@wildcash.com>
References: <1224.83.227.26.235.1126295484.squirrel@webmail.2lug.se>	<200509092345.40386.rob0@gmx.co.uk>
	<43258442.4000009@wildcash.com> <200509111634.51592.rob0@gmx.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200509111634.51592.rob0@gmx.co.uk>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi,

> I don't really know what you're doing!

Really ... there's only a few lines, I kept them to a minimum
so one could simply read them and one can see what happening.

> You have added "inet" and "implan" tables, but we don't know what they
> are nor what they are used for.

Ummm ... 'inet' means internet and 'implan' mean Local Area Network.

I though this was intuitive and explains itself, there is only two after
all.

> MASQUERADE is a form of source NAT, not forwarding, strictly speaking. 
> It's useful to understand the difference. Furthermore it's not 
> appropriate in this case, where (I presume) you have a static IP on 
> eth0. (If not, you probably should.)
> 
> And the whole purpose is unclear. If you've got a NAT router on eth0, 
> why not connect your LAN to that? 

Well first up I want to learn how to route from one interface to
another. I don't know if this is the best way, I'm reading up by myself
and making an effort to try figure it out.

>> Why the extra hop?

I want to split up my machines and networks, enable bandwith controls,
control access to resources add securtiy etc etc etc .....


Regards,
Rudi.


