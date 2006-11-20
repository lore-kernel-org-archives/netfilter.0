From: "Noman Jamil" <njamil@gmail.com>
Subject: Fwd: multiple DNAT alternative?
Date: Mon, 20 Nov 2006 16:07:58 +0500
Message-ID: <f5e96a3c0611200307y6dfc367fr574ced2a39f6d739@mail.gmail.com>
References: <f5e96a3c0611200306x1edc99f1hb848246cd48634e1@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <f5e96a3c0611200306x1edc99f1hb848246cd48634e1@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi all,

 Is there any alternative of multiple DNAT's  which is been droped in
the latest kernels or after 2.6.10.x kernel tree. All i want to do is,
traffic meant for a particular internal IP should be forward to
multiple destinations not as load balacing but as per the connection
tracking. Blow are the desired command of DNAT.


 iptables -t nat -A PREROUTING -p udp -s 0/0 -d 10.0.2.107 -j DNAT
--to 202.125.136.60-202.125.136.70
  (This command is fine and it works too, but i want to do is  not to
load balance between the ips but to pick up the ip for which data is
meant for)


 iptables -t nat -A PREROUTING -p udp -s 0/0 -d 10.0.2.107 -j DNAT
--to-destination 202.125.136.60 --to-destination 194.202.94.1
 (Any alternative for this command which is depricited after 2.6.10
kernel tree.)

 I would be very thankful for your prompt response.

 Regards,
 Nouman

-- 
Deciving Looks

-- 
Deceving Looks

