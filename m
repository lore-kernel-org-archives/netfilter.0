From: Arnt Karlsen <arnt@c2i.net>
Subject: Re: Re[2]: access to server
Date: Wed, 30 Apr 2003 04:47:45 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030430044745.621e715a.arnt@c2i.net>
References: <5436369716.20030430004931@o2.pl>
	<20030430031030.50b8d13b.arnt@c2i.net>
	<1246491441.20030430033812@o2.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1246491441.20030430033812@o2.pl>
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
To: netfilter_user <netfilter_user@o2.pl>
Cc: netfilter@lists.netfilter.org

On Wed, 30 Apr 2003 03:38:12 +0200, 
netfilter_user <netfilter_user@o2.pl> wrote in message 
<1246491441.20030430033812@o2.pl>:

> Hello Arnt,
> 
> Wednesday, April 30, 2003, 3:10:30 AM, you wrote:
> 
> AK> On Wed, 30 Apr 2003 00:49:31 +0200, 
> AK> netfilter_user <netfilter_user@o2.pl> wrote in message 
> AK> <5436369716.20030430004931@o2.pl>:
> 
> >> Rule: "iptables -A FORWARD -i eth1 -p udp -m --multioport --dport 
> AK>                                                      /\
> AK> ..is " -m --multioport " a valid match in iptables, or a correct 
> AK> quote of your attempt to write  ' -m --multiport ' ?
> 
> damn my wrong...it should looks like this:
> iptables -A FORWARD -i eth1 -p udp -m --multioport --dport 23073,23083
> -j ACCEPT                                   /\
                                              ||
..lets try again: I don't find "-m --multioport" _anywhere_ 
in the docs, so, if you _actually_ try '-m --multioport' in
your rule set, it _should_ fail, then you'll wanna try 
'-m --multiport', without your extra "o".  ;-)

-- 
..med vennlig hilsen = with Kind Regards from Arnt... ;-)
...with a number of polar bear hunters in his ancestry...
  Scenarios always come in sets of three: 
  best case, worst case, and just in case.



