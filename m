From: justin <justin@dslr.net>
Subject: Re[2]: iplimit module refuses to work
Date: Mon, 11 Aug 2003 17:47:20 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <162365409015.20030811174720@dslr.net>
References: <63349768828.20030811132640@dslr.net>
 <20030811183136.GD11900@cannon.eng.us.uu.net>
Reply-To: justin <justin@dslr.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030811183136.GD11900@cannon.eng.us.uu.net>
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
To: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Cc: netfilter@lists.netfilter.org

yes I do ..  and other modules work just fine, as does the firewall.

The only problem is iplimit flunking out with this unknown error.

Its not even like its explaining what socket option is failing, nor are
there any console messages from the kernel as it rejects the bogus
socket option call.

Chain CloseY (1 references)
target     prot opt source               destination
DROP       tcp  --  0.0.0.0/0            0.0.0.0/0          tcp flags:0x16/0x02
REJECT     tcp  --  0.0.0.0/0            0.0.0.0/0          recent: UPDATE seconds: 1 hit_count: 10 name: Close side: source reject-with tcp-reset
DROP       all  --  0.0.0.0/0            0.0.0.0/0

Chain OverX (0 references)
target     prot opt source               destination
           all  --  0.0.0.0/0            0.0.0.0/0          recent: SET name: Last side: source
DROP       tcp  --  0.0.0.0/0            0.0.0.0/0          tcp flags:0x16/0x02 #conn/32 > 125
RETURN     all  --  0.0.0.0/0            0.0.0.0/0          recent: CHECK seconds: 60 name: First side: source
CloseY     all  --  0.0.0.0/0            0.0.0.0/0          recent: CHECK name: First side: source
RETURN     all  --  0.0.0.0/0            0.0.0.0/0          recent: CHECK name: First side: source
           all  --  0.0.0.0/0            0.0.0.0/0          recent: SET name: First side: source

Chain TcpLimit (0 references)
target     prot opt source               destination
RETURN     tcp  --  0.0.0.0/0            0.0.0.0/0          tcp flags:0x04/0x04
RETURN     tcp  --  0.0.0.0/0            0.0.0.0/0          tcp flags:0x01/0x01

Chain UnderX (0 references)
target     prot opt source               destination
RETURN     all  --  0.0.0.0/0            0.0.0.0/0          recent: CHECK seconds: 60 name: Last side: source
           all  --  0.0.0.0/0            0.0.0.0/0          recent: REMOVE name: Last side: source
           all  --  0.0.0.0/0            0.0.0.0/0          recent: REMOVE name: First side: source



>> 
>> I can't get the iplimit module to work for me,
>> this is an SMP AMD machine.
>> 
>> # iptables -A TcpLimit -m iplimit --iplimit-above 125 -j OverX

RD> Do you have OverX and TcpLimit as chains?

RD> Ramin

>> 
>> iptables: Invalid argument
>> 
>> strace -f ...
>> 


