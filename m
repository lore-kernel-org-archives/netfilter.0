From: James MacLean <macleajb@ednet.ns.ca>
Subject: Private traffic seen on public NATed interface - Linux 2.6.10-11
 tested
Date: Tue, 15 Mar 2005 15:30:42 -0400
Message-ID: <423737E2.4050201@ednet.ns.ca>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------080702030407090001070109"
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
To: netfilter@lists.netfilter.org

This is a multi-part message in MIME format.
--------------080702030407090001070109
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi Folks,

Today we noticed that some traffic appears to be getting by netfilter 
unNATed. The computers use typical SNATing such as :

iptables -t nat -I POSTROUTING -j SNAT -s <private ip space> -o eth0 
--to <IP of eth0>

While we were dumping traffic on the public interface, we noticed 
private IPs showing up in our dumps.

We verified that there existed sessions between private IPs and public 
Internet sites where some of the private traffic was returning to the 
Internet site not NATed.

We started watching, and saw this occur on servers with 2.6.11 and 
2.6.10 kernels which are all we have to test with.

These kernels were compiled locally.

For example, tcpdumping on a public interface where no private IPs 
should live :

15:19:22.066190 IP 10.0.7.100.2640 > 142.176.33.171.http: R 
2946695981:2946695981(0) ack 4138631275 win 0
15:19:22.066516 IP 10.0.7.100.2641 > 142.176.33.170.http: R 
818314876:818314876(0) ack 4144245614 win 0
15:19:22.066684 IP 10.0.7.100.2638 > 142.176.33.170.http: R 
3381617258:3381617258(0) ack 4136231656 win 0
15:19:22.067353 IP 10.0.7.100.2639 > 142.176.33.170.http: R 
3920569986:3920569986(0) ack 4133397861 win 0
15:19:22.068045 IP 10.0.7.100.2642 > 142.176.33.170.http: R 
3340982500:3340982500(0) ack 4135371285 win 0
15:19:24.001820 IP 10.0.5.13.2023 > 65.54.194.118.http: F 0:0(0) ack 1 
win 64790

It appears the offending traffic is not payload type traffic and is just 
control traffic, although our testing was only looking at a small dump 
with Ethereal.

Is there something we may have been setting up incorrectly?
JES

--------------080702030407090001070109--

