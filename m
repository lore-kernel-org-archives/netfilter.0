From: "Bruno Nunes" <nunesb@gmail.com>
Subject: Rsync PortRedirection
Date: Mon, 3 Jul 2006 10:33:50 -0300
Message-ID: <52837e3e0607030633k5320f2f2rc9b8564c9fe5d10e@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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

Hi,
   How can i use rsync beetwen 2 computers in diferents networks? I
put an addicional ip address in the router to host this forward that i
will call _ip2

Computer A = 139.82.xxx.xx1
Computer B = 192.168.1.4
router_ip2 = 139.82.xxx.xx2

router_ip2 and computer A are onde the same network
router is on both networks, of course

rsync uses port 873 i guess

this is what i want to run:
rsync -razvp localhost:/home/ 139.82.xxx.xx2::backup/daily

139.82.xxx.xxx -> router -> 192.168.1.4 : 873

i tried:
iptables -t nat -A PREROUTING -d 139.82.xxx.xx2 -i eth0 -p tcp --dport
873 -j DNAT --to 192.168.1.4
...but didnt work

thanks

