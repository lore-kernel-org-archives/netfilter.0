From: Kirk <whereisgui@gmail.com>
Subject: rules to allow a machine to join a windows domain
Date: Tue, 3 May 2005 11:07:03 -0700
Message-ID: <48be50bb05050311073f5f4d3@mail.gmail.com>
Reply-To: Kirk <whereisgui@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hello everyone,

I need to start moving three windows servers behind a firewall. Could
someone tell me what ports I need to open so that the servers can join
a windows domain?

I already allow access to DNS( udp 53, tcp 53)  and WINS(tcp 137)
servers but the test server still can't join the domain. The error I
get is "a domain controller could not be contacted".

I should point out that I'm able to connect to websites from the test
server and I can connect to the web server I installed for testing
incoming connections. Also, I'm able to join the domain when I take
the machine off the firewall.

Any hints will be appreciated.
Thanks,
-K

