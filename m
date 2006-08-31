From: nunezj@ucbcba.edu.bo
Subject: Filter ips
Date: Thu, 31 Aug 2006 18:34:17 -0400 (BOT)
Message-ID: <4298.200.87.170.170.1157063657.squirrel@admin.ucbcba.edu.bo>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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

Hi everyone

       I have some problems when I want to filter some ips in  my network

 I put this rules in the my script:

 iptables -A INPUT -s 192.168.0.5/32 -d 0/0 -p tcp --dport 20,21 -j DROP

 but it doesn't work. The same I put in the Output rules but it doen't
work....

  How can I make this filter?

regards,

             Jorge Enrique


