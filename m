From: "Maciej Soltysiak" <solt@dns.toxicfilms.tv>
Subject: Odp: Logging packet owner
Date: Fri, 12 Dec 2003 17:01:43 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <017b01c3c0c9$42cd0dc0$1024fe96@ae.poznan.pl>
References: <3FD8E2D6.3040803@live365.com> <1071180480.10512.8.camel@porky>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Try my patch:

It adds uid and gid (if applicable) of the socket that sent the packet.
It will show you who is sending whcih packets.
It would be easy to add the information about the process that handles
that packet (if applicable)

http://www.soltysiak.com/linux/LOG-ids.patch

Regards,
Maciej



