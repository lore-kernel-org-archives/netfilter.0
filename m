From: "Marco Berizzi" <pupilla@hotmail.com>
Subject: intelligent load balancing
Date: Mon, 02 Jan 2006 18:22:55 +0100
Message-ID: <BAY103-F222975DA0359A6311DC097B22D0@phx.gbl>
Mime-Version: 1.0
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
Content-Type: text/plain; format=flowed; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: netfilter@lists.netfilter.org

I'm doing simple load balancing with two cheap adsl lines using
nth to SNAT packets:

-m nth -every 2 -packet 1 -SNAT adslA
-m nth -every 2 -packet 2 -SNAT adslB

This is working quite good, but I would like to do an intelligent
load bal. Here is how it is currently working:

1=B0 socket -->> SNAT adslA --- 3k gif file
2=B0 socket -->> SNAT adslB --- 700m iso Slackware 1=B0 cd image
3=B0 socket -->> SNAT adslA --- 5k html text only page
4=B0 socket -->> SNAT adslB --- 700m iso Slackware 2=B0 cd image
5=B0 socket -->> SNAT adslA --- 2k png file
6=B0 socket -->> SNAT adslB --- 40m tar.gz linux source file

As you can see adslB line is full and adslA line is empty.
Is there anyway to optimize this?



