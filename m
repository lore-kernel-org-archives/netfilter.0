From: "Burton" <burton@thevine.net>
Subject: SNAT Question
Date: Tue, 14 Dec 2004 09:30:42 -0800
Message-ID: <20041214173955.BA009410721@mailroute.thevine.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

I need help setting up a server I am working with.
 
I am not very knowledgeable in regards to Linux. 
 
With that in mind I have read several HOWTO's and I am convinced that SNAT
is what I need to do this.
 
What I am trying to do is I have to servers on two different T1's located on
the same switch.
 
I would like server1 (my Linux Server) to accept an incoming connecting via
its IP address on T1(1) 12..22.81.18 on port 10025 and forward that request
to server2(my Windows Mail Server)  on T1(2) 204.250.113.2 on port 25
 
I have tried several combinations of 
iptables -t nat -A POSTROUTING -p tcp -o eth0 -j SNAT --dport 10025 --to
204.250.113.2:25 
 
What am I doing wrong or am I looking at the wrong tool.
 
