From: Axel Heinrici <heinrici76@gmx.de>
Subject: Re: Fw: iptables-save/restore question
Date: Tue, 17 Sep 2002 15:39:31 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200209171338.PAA32599@axpmgr.physik.rwth-aachen.de>
References: <006b01c25e32$5ede5500$6307a8c0@net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <006b01c25e32$5ede5500$6307a8c0@net>
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

Hi

On Tuesday 17 September 2002 12:09, Bo Jacobsen wrote:
> HI,  I have tried the following:
>
> I run some iptables commands then run iptables -L -n > testfile1
> to save the setup. Then I run iptables-restore testfile1 and than
> run iptables-save again: iptables -L -n > testfile2
>
> When I run diff on the two files (testfile1, testfile2) I can see
> that they are NOT the same. In the following is an example of
> what diff finds different:
> .......
>
> The reason we want to make this test is that we need to be sure
> that the rules generated directly by the iptables commands, are
> EXATLY the same as what the iptables-save/restore command pair
> does.
>
> One thing is to test that the iptable commands works, another is
> to blindly trust that our 300 iptable rules are correctly saved
> and restored by iptables-save/restore (a firewall with 4
> different local lans). If there is another way of confirming
> iptables-save/restore results, I would appreciate some info.
>
This means that you want to prove iptables-save/restore by using 
iptables. IMHO from this test you only prove something like 
"self-consistency" of iptables. You should run nmap or even more 
sophisticated tests to prove if everything is working the way you 
want.
If you want to asure someone else by this show then try 
iptables-restore testfile2. And afterwards use iptables -L -n 
>testfile3. Then run diff on testfile2 vs. testfile3 and see if 
this result is more convincing :-) 

greetings 
	Axel


