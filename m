From: "hard__ware" <hard__ware@hotmail.com>
Subject: JNAT and SNAT private <-> public, but can't get to port 80 . . .
Date: Wed, 12 Jun 2002 13:10:07 +1000
Sender: netfilter-admin@lists.samba.org
Message-ID: <OE28aQUXPXF2aZcdjaS00008b5a@hotmail.com>
Reply-To: "hard__ware" <hard__ware@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

Your problem might be to do with a ESTABLISHED, RELATED

in you Input & Output Chains (i mean you may have to add them)

i have recently posted alot of Pre Writin scripts that will do all this for
you ... :D

if you wish you can look at them Posted all over the Netfilter Page from me
...

or if ya want i can send you my Latest Script , which has alot of these
examples for what you doing ... :D



