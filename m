From: Kim Jensen <kimj@dawn.dk>
Subject: Re: Iptables && Eroor : too long (must be under 30 chars)
Date: Wed, 26 Mar 2003 18:02:32 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200303261802.32736.kimj@dawn.dk>
References: <200303261754.13392.matteo.king@libero.it>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200303261754.13392.matteo.king@libero.it>
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
To: Matteo <matteo.king@libero.it>, netfilter@lists.netfilter.org

On Wednesday 26 March 2003 17:54, Matteo wrote:
> Hi all , i have write a script for iptables with my rules but when I la=
unch
> this script i have this error :
> too long (must be under 30 chars)......
>
> How can I resolve this??
>
Try to comment out all your lines and then slowly enable them again, that=
 way=20
you can quickly detect the line. However, if it complains that a string i=
s=20
too long, then I would start with your log entries.

/Kim


