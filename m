From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: ports 137 to 139
Date: Wed, 21 Jul 2004 15:53:54 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407211553.54223.Antony@Soft-Solutions.co.uk>
References: <HAEOIFPIBBBLGLHOMLLIOEONCEAA.bclark@eccotours.biz>
Reply-To: netfilter <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <HAEOIFPIBBBLGLHOMLLIOEONCEAA.bclark@eccotours.biz>
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
To: netfilter <netfilter@lists.netfilter.org>

On Wednesday 21 July 2004 11:29 am, Brent Clark wrote:

> Hi all
>
> Stupid question, must ports 137 to 139 (basically netbios) be open a drop
> default policy fw.

Close them and do not log all the accesses you will get from script kiddies 
trying to find open Windoze shares.

> One of my friends is suggesting that I must open it.

Ask this friend why on earth you should allow Windoze file sharing between 
your network and the Internet (in either direction).

> I cant see the need for this.

Good man :)

Regards,

Antony.

-- 
Bill Gates has personally assured the Spanish Academy that he will never allow 
the upside-down question mark to disappear from Microsoft word-processing 
programs, which must be reassuring for millions of Spanish-speaking people, 
though just a piddling afterthought as far as he's concerned.

 - Lynne Truss, "Eats, Shoots and Leaves"

                                                     Please reply to the list;
                                                           please don't CC me.


