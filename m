From: Andreas Meyer <anmeyer@gmx.net>
Subject: Re: Re[2]: strange connetions to exodus.net
Date: Sat, 21 Feb 2004 19:26:07 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040221192607.6c24d4f2.anmeyer@gmx.net>
References: <20040221122547.1cb9a3eb.anmeyer@gmx.net>
	<1077377146.5329.8.camel@tarkus>
	<20040221170951.6d7ddfae.anmeyer@gmx.net>
	<200402211136.22220.JALaramie@Loudoun-Fairfax.com>
	<20040221181940.7dc7d439.anmeyer@gmx.net>
	<96993686.20040221150628@attla.net.ar>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <96993686.20040221150628@attla.net.ar>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Alexis <alexis@attla.net.ar> wrote:

> Now we see.
> 
> Like you said, if this is your webserver, some site inside your
> webserver are using ads in this destination
> 
> exodus are only the dns for this addresses, but you are connecting to servedby.advertising.com
> 
> and, in your schema, where is 192.168.20.60?

+------------+   +-----------------+   +----------------------+
|WKS         |   |DMZ 192.168.1.75 |   |Gateway 192.168.20.210|
|192.168.1.3 |-->|    192.168.20.60|-->|                      |
|with Opera  |   |with Squid etc.  |   +----------------------+
+------------+   +-----------------+

But! I think I found the answer to my problem. I think
Opera is the one who is causing this request. As soon
as I use for example Firebird there are no such requestes.

Ooooh, I have to watch this furthermore.

Thank you all for your patience!

-- 
   Andreas Meyer   | http://www.anup.de
                   | http://homeservice.anup.de/andreas


