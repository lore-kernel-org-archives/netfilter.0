From: Frank Gruellich <frank@home.manuelm.org>
Subject: Re: Dinamic (www list) IP BAN ...
Date: Thu, 22 Apr 2004 19:00:25 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040422170025.GE6219@home.manuelm.org>
References: <1331752368.20040422174719@lpgc.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1331752368.20040422174719@lpgc.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

Hello,

* Roque <roque@lpgc.net> 22. Apr 04:
> I need to ban a number of IP=B4s that are posted in a plain text file on
> a web site; the file changes every 30Min. The file is as simple as
>=20
> banned-ip1    #Reason1
> banned-ip2    #Reason
> ...
>=20
> The url can be reached in this way: http://www.url.com/ip/banned.txt

WARNING: this is very, very bad!  Don't insert rules automatic from an
untrusted source (anything outside of your net _is_ untrusted).  Said
this...

> I have read the iptables man pages and haven=B4t seen nothing similar.
> Is it really posible to do so?

 # iptables -N banned_ips 2>/dev/null
 # iptables -F banned_ips
 # wget --output-document=3D- http://www.url.com/ip/banned.txt |
 > while read ip reason
 > iptables -A banned_ips -d $ip -j REJECT
 > done

Repeat this every 30min by cron.  Insert the chain banned_ips whereever
you need it (likely in your FORWARD).

HTH,
 regards, Frank.
--=20
Sigmentation fault

