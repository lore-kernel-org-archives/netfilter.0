From: Fabio Yu Nagahama <nagahama@secom.ufpa.br>
Subject: NAT with log
Date: Thu, 05 Sep 2002 10:10:35 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <5.1.0.14.2.20020905100458.00ad6de0@mail.pop-pa.rnp.br>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Anybody,
I want make a computer works as a router, and this is my situation:
I installed a linux machine as router with no problem.
I have an internal network with invalid IPs and 6 ranges of C class IPs 
availabe. I can make the NAT with no problem, but I need to make a log of 
witch internal IP got out with witch valid IP. Does anybody know how to do 
that?

My ideia, if I log the forward chain, it will not show me witch IP the 
connection took to go out.

Thanks,

Fabio Nagahama


