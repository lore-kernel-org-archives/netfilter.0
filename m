From: "Carl Morgan" <killgoretrout59@hotmail.com>
Subject: Copying nf_info
Date: Thu, 13 May 2004 13:05:38 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <BAY2-F983CAaY6OqdBP0000671a@hotmail.com>
Mime-Version: 1.0
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
Content-Type: text/plain; format=flowed; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: netfilter@lists.netfilter.org

Hello all,
  I am writing a program that requires I copy nf_info from an entry to=20
another one.  The general idea of the program is this:

struct some_struct {
                                struct nf_info* info;
                            };

struct some_struct temp1;
struct some_struct temp2;

and in effect I want temp2->info=3Dtemp1->info.  Can someone please help.

Tex Morgan

_________________________________________________________________
MSN Toolbar provides one-click access to Hotmail from any Web page =96 FREE=
=20
download! http://toolbar.msn.com/go/onm00200413ave/direct/01/


