From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: Connection states information tables
Date: Tue, 21 Sep 2004 12:00:18 -0700
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF5679512@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
content-class: urn:content-classes:message
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: condor_rl@libero.it, netfilter@lists.netfilter.org

> My question is:
> How many state tables are used? one table for each main chain?
> One for INPUT and one for OUTPUT?

The STATE is maintained by the ip_conntrack module. It uses one big list
to maintain the current state of all active sessions through the system.
Run cat /proc/net/ip_conntrack to see the human readable version of this
list.

