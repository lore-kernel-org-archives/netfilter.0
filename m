From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: IPLIMIT Patch UDP
Date: Fri, 21 Feb 2003 03:22:31 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200302210322.31461.netfilter@newkirk.us>
References: <HEEHJDADEHEPKKEAOCPPAEPHCCAA.susan.sagan@cgi.com> <20030219162633.GC455@eychenne.org> <1045785009.1014.74.camel@alex.pcprices.com.pe>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1045785009.1014.74.camel@alex.pcprices.com.pe>
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
To: "Ing. CIP Alejandro Celi  Mariategui" <alex@linux.org.pe>, netfilter@lists.netfilter.org

On Thursday 20 February 2003 06:50 pm, "Ing. CIP Alejandro Celi "=20
Mariategui wrote:
> (Sorry, but my english is very bad)
>
> Hi,
>
> I compile with p-o-m the server kernel with IPLIMIT Patch by Gerd
> Knorr <kraxel@bytesex.org>
>
> It work fine, i can limit ex: max 10 TCP connections on the server,
> but i want to limit the UDP connections to 10 (max).
>
> How I can do it?
>
> Alex

The IPLIMIT patch is limited to only work with TCP.  You'd likely need to=
=20
write your own changes to the kernel.  At a VERY quick glance, this:

+=09/* refuse anything but tcp */
+=09if (ip->proto !=3D IPPROTO_TCP)
+=09=09return 0;

in the IPLIMIT patch (in iplimit.c) MIGHT provide the solution if it=20
accomodated IPPROTO_UPD as well as, or instead of, IPPROTO_TCP.

j


