From: Arnt Karlsen <arnt@c2i.net>
Subject: Re: smoothwall
Date: Fri, 10 Oct 2003 20:59:09 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031010205909.177f2c73.arnt@c2i.net>
References: <F22386C3FEB012449238672E38ED61E70A8D08@overlord.overturemedia.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <F22386C3FEB012449238672E38ED61E70A8D08@overlord.overturemedia.com>
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

On Mon, 29 Sep 2003 17:02:43 +0800, 
"Fritz Mesedilla" <fritz.mesedilla@overturemedia.com> wrote in message 
<F22386C3FEB012449238672E38ED61E70A8D08@overlord.overturemedia.com>:

> 
> Hello folks!
> 
> Has anyone tried smoothwall?
> I have become tired of making samba work and still it won't work so
> now I am resorting to using a "pre-built" iptables firewall. At least
> it is GUI-based. :D
> 
> I've always wanted to make my own firewall bash script.
> If I can make smoothwall and samba to work properly then perhaps I can
> use the firewall script it generates to make my own, right?
> 
> So can anyone advice me on this one?

..needs its own box, if your ok with that, chk out ipcop.org.

..also possible to set up a basic debian with 2.4.18 (bf24) and 
rip out ipchains and install shorewall.net and webmin.com,
do 'apt-get remove --purge ipchains ; apt-get update ; apt-get \
upgrade ; apt-get install shorewall webmin ', then go into webmin's
update menu to update webmin to 1.110 or whatever it is now, 
then go into webmin's shorewall menu.  ;-)

-- 
..med vennlig hilsen = with Kind Regards from Arnt... ;-)
...with a number of polar bear hunters in his ancestry...
  Scenarios always come in sets of three: 
  best case, worst case, and just in case.


