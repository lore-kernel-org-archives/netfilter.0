From: Anders Fugmann <afu@fugmann.dhs.org>
Subject: Re: mangle tables.
Date: Tue, 10 Sep 2002 12:05:35 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3D7DC3EF.6060709@fugmann.dhs.org>
References: <3D7D9614.1040205@fugmann.dhs.org> <200209100939.g8A9d0v06610@vulcan.rissington.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Antony Stone <Antony@Soft-Solutions.co.uk>
Cc: netfilter@lists.samba.org

Hi Antony

Many thanks for your reply.
I see that I understand most of it.

Antony Stone wrote:
> On Tuesday 10 September 2002 7:49 am, Anders Fugmann wrote:
> 
>>Next, if the above is correct, when does packets hit the chains,
>>e.g. what chains are traversed between PREROUTING and FORWARD and
>>POSTROUTING, in the forwarding example?
> 
> 
> I don't know the answer to this for the latest version of netfilter, however 
> it is very easy to find out for yourself, for the specific version you are 
> running (which is usually the important thing).
Is this true - can someone please confirm this. It seems strange that 
only the order of chain traversal is specified within a table, but not 
across tables (If I understand you correctly, Antony).
This means, for example, that the mark cannot be used to to mark packets 
for later processing. (Mark in mangle and match in filter).

> 
> Simply set up a series of LOGging rules in the different chains & tables, 
> send some packets through the system, and the log file will tell you what 
> order the packets went through the different parts of netfilter.
> 
> Try this:
> 
> for chain in INPUT OUTPUT FORWARD PREROUTING POSTROUTING
> do
>   for table in filter mangle nat
>   do
>     iptables -I $chain -t $table -j LOG --log-prefix="$chain $table "
>   done
> done
Yes, but I was hoping to avoid it :-)

-- 
Neo: 'Can you fly that thing?'
Trinity: 'Not yet'.
$ apt-get install pilot-prg-v212helicopter.


