From: ftnx@ksbase.com (Not Here)
Subject: Preventing to bind an interface (or solving that problem with
Date: Thu, 10 Mar 2005 08:20:43 -0500
Message-ID: <1110442915@ksbase>
References: <200503101133.07755.panizzon@woody.ch>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <200503101133.07755.panizzon@woody.ch>
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


Thursday March 10 2005 11:33, Benoit Panizzon wrote to All:


 eth0 =>> $IP from Cable ISP.
 eth1 =>> x.y.z.1 (my own IP with correct PTR Entries etc.) on LAN.

 BP> Now unfortunately bind, sendmail and everything binds on both
 BP> IP-Addresses.

Set gateways for both networks.

Kari Suomela

   KARICO Business Services
   Toronto, ON Canada
   http://www.karico.ca


