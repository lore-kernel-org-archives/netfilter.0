From: Stefan Grossberger <stefan.grossberger@andtek.com>
Subject: Re: How to do SNAT and DNAT when FW is the Mixed(Bridge and Route)
	mode?
Date: 28 Feb 2003 14:28:08 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1046438887.4603.36.camel@sgrossberger-mobile.andtek.com>
References: <20030228011944.63096.qmail@web15211.mail.bjs.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030228011944.63096.qmail@web15211.mail.bjs.yahoo.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="utf-8"
To: netfilter@lists.netfilter.org

you have to put the snat rule to the br0 interface!
or even better use MASQUERADE:
iptables -t nat -A POSTROUTING -o br0 -j MASQUERADE

On Fri, 2003-02-28 at 02:19, Dig Harry wrote:
>  > My network is the following:
> > 
> >               External(0.0.0.0)
> >                  ^
> >              ____|eth0____
> >             |    FW       |eth1-->DMZ
> >             |             |(192.168.200.0/24)
> >              -------------
> >              eth2|
> >                  V
> >               Internal(10.1.1.0/24)
> > 
> > Linux Kernel have patched
> > "bridge-nf-0_0_7-against-2_4_18_diff"
> > My config is:
> > brctl addbr br0
> > ifconfig eth0 0.0.0.0
> > ifconfig eth1 0.0.0.0
> > brctl addif br0 eth0
> > brctl addif br0 eth1
> > ifconfig br0 192.168.200.1 netmask 255.255.255.0
> > ifconfig eth2 10.1.1.1 netmask 255.255.255.255.0
> > 
> > from Internal to DMZ or External must do SNAT.
> > 
> > I set policy:
> > iptables -t nat -A POSTROUTING -o eth0 -j SNAT
> > --to-source 192.168.200.1
> > iptables -t nat -A POSTROUTING -o eth1 -j SNAT
> > --to-source 192.168.200.1
> > 
> > Accessing from Intenal to DMZ or External can not
> > pass!
> > 
> > My config is correct???
> > The "bridge-nf" patch can support the case???(if
> > not,
> > how to do?) 
> > Thank you very much!
> > 
> > 
> > 
> >                
> > 
> > 
> >
> _________________________________________________________
> > Do You Yahoo!? 
> > "用雅虎搜索，找到关于奥斯卡的一切"
> >
> http://cn.search.yahoo.com/search/cn?p=%b0%c2%cb%b9%bf%a8
> >  
> 
> _________________________________________________________
> Do You Yahoo!? 
> "用雅虎搜索，找到关于奥斯卡的一切"
> http://cn.search.yahoo.com/search/cn?p=%b0%c2%cb%b9%bf%a8
-- 
Stefan Grossberger <stefan.grossberger@andtek.com>


