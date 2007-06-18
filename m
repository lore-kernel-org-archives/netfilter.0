From: switcher <switcher@linuxwall.info>
Subject: Re: Check connection state in libipq hook
Date: Mon, 18 Jun 2007 20:22:42 +0200
Message-ID: <20070618202242.wa8gjjs892ysg0w8@webmail.microgate.fr>
References: <20070618161548.120li24u9dcsok0k@webmail.microgate.fr>
	<4676CBB7.4080808@netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4676CBB7.4080808@netfilter.org>
Content-Disposition: inline
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

Pablo Neira Ayuso <pablo@netfilter.org> a =E9crit :

> switcher wrote:
>>  I'm coding a software that check if an incoming packet is part of an ac=
tive
>>  connection.
>>  I'm using libipq to get the packet and I tried to submit it to
>>  ip_conntrack_find_get() as a tuple create with ip_conntrack_tuple but i=
t
>>  doesn't work so I have some questions about that.
>>
>>  I'm creating the tuple and submitting it with that piece of code :
>>  --------
>>  struct ip_conntrack_tuple *tuple;
>>  tuple->src.ip                 =3D iph->saddr;
>>  tuple->src.u.tcp.port         =3D tcp->source;
>>  tuple->dst.ip                 =3D iph->daddr;
>>  tuple->dst.u.tcp.port         =3D tcp->dest;
>>  tuple->dst.protonum         =3D iph->protocol;
>>  tuple->dst.dir                =3D 0;
>>  if (NULL =3D=3D ip_conntrack_find_get(tuple, NULL))
>>  {
>>       fprintf(stdout, "tuple IS NOT part of an active connection");
>>  }
>>  else {
>>       fprintf(stdout, "tuple IS part of an active connection");
>>  }
>>  --------
>>  But I don't know what to put in tuple->dst.dir value... is it a 
>> static value ?
>>
>>  Moreover, I included <linux/netfilter.h>,
>>  <linux/netfilter_ipv4/ip_conntrack_tuple.h> and
>>  <linux/netfilter_ipv4/ip_conntrack_core.h> (kernel 2.6.17.7) but 
>> when I try to
>>  compile it, I have an error message :
>>  --------
>>  /usr/include/linux/netfilter_ipv4/ip_conntrack_core.h: In function
>>  'ip_conntrack_confirm':
>>  /usr/include/linux/netfilter_ipv4/ip_conntrack_core.h:44: error: 
>> dereferencing
>>  pointer to incomplete type
>>  /usr/include/linux/netfilter_ipv4/ip_conntrack_core.h: At top level:
>>  /usr/include/linux/netfilter_ipv4/ip_conntrack_core.h:59: error: 
>> syntax error
>>  before 'ip_conntrack_lock'
>>  --------
>>
>>  I'm not manipulating 'ip_conntrack_confirm' nor 'ip_conntrack_lock' 
>> so I guess
>>  I've made a mistake somewhere but I don't know where...
>>  Could you help me ?
>
> Misconception: The connection tracking is a kernel module. libipq is 
> a userspace library. You can't invoke such functions from userspace.
>

Errr...
So, do you know another technique that I can use to do so in userspace ?
I could maintain a connection state table in userspace but I think it's 
a waste
of time to redo netfilter's job...


thanks,
julien



