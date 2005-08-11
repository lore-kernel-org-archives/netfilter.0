From: Toby DiPasquale <codeslinger@gmail.com>
Subject: Re: IPTables for Sun Solaris
Date: Thu, 11 Aug 2005 08:22:33 -0400
Message-ID: <876ef97a05081105228ecd1d8@mail.gmail.com>
References: <5AD6E09C3CB0BE4E83BDABFBF560EA0002C2B1B9@usanbrmbx01.ds.liz.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <5AD6E09C3CB0BE4E83BDABFBF560EA0002C2B1B9@usanbrmbx01.ds.liz.com>
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
To: Ruiyuan Jiang <Ruiyuan_Jiang@liz.com>, netfilter@lists.netfilter.org

On 8/9/05, Ruiyuan Jiang <Ruiyuan_Jiang@liz.com> wrote:
> I am new to the list. I just downloaded iptables-1.3.3. From INSTALL
> file, it seems IPTables only supports Linux. I have Solaris 10 for
> SPARC. Does IPTables support Solaris and HP-UX, etc.? Thanks.

No, iptables can only be used with Linux because it relies on the
netfilter framework in the Linux kernel. Solaris' kernel lacks
netfilter, therefore it cannot make use of iptables. You might be able
to get a command-line tool with the same interface as iptables for
Solaris, however; look around.

--=20
Toby DiPasquale
0x636f6465736c696e67657240676d61696c2e636f6d

