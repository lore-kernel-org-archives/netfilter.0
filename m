From: =?iso-8859-1?Q?Ant=F3nio_Godinho?= <to@mail.isec.pt>
Subject: RE: Various questions
Date: Mon, 28 Jul 2003 16:47:13 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000101c3551f$838bf300$5f50a8c0@isec.pt>
References: <7C9884991ADAE0479C14F10C858BCDF5122E0D@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <7C9884991ADAE0479C14F10C858BCDF5122E0D@alderaan.smgtec.com>
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

>>	Is it possible to DROP all those IP's in one rule? ( I don't
>>need to log them since they are invalid anyway )
>
>
>Ideally this is done for you with /proc/sys/net/ipv4/conf/*/rp_filter
=3D=3D 1 >or 2. Basically it says that if a packet enters the interface =
with
an ip >address that is not on the subnet associated with it, then just
drop the >packet. That said, I don't see how these rules would seriously
determent >performance that much.

Well I've made an script to enable this on a specific run level and I've
added this:
echo "2" > /proc/sys/net/ipv4/conf/all/rp_filter

It was on the packet filter how-to:)


>	3. This is defining priority ports? Like shaping the traffic?
>
>yes
>
>>	3. Since all my traffic from intranet to gateway loc2fw chain
>>it's from trusted ip's ( it's from me or any member of my famely ),
>>that's one of the things I can remove, anyone has any other advice or
>>improvent to the listo f rules I've bellow?
>
>If you are memory bound, these will not help you much. If your memory
is >really the contention, then try lowering the timeouts for things
like >established or unreplied connections, etc.. these things are what
takes up >the memory.

I've seen a comment on some forum that iptables "eats" lots of memory,
so on old computers the scripts should be optimized. Anyway scripts
should be optimized on any computer I guess. Thanx for your advice I'll
dig on that.


	Ant=F3nio Godinho


