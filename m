From: Jiann-Ming Su <sujiannming@gmail.com>
Subject: Re: Problem with conntrack, all packet are marked as invalid.
Date: Thu, 25 Aug 2005 13:11:47 -0400
Message-ID: <561dc32605082510112895bd22@mail.gmail.com>
References: <430C893B.5070904@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <430C893B.5070904@gmail.com>
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

On 8/24/05, Tien-Ren Chen <trchen1033@gmail.com> wrote:
> All packets are marked as INVALID, however, connection tracking works wel=
l:

Hmm... hope I don't derail this thread, but I wonder if the problem
you described is related to this bug:=20
https://bugzilla.redhat.com/bugzilla/show_bug.cgi?id=3D161898

--=20
Jiann-Ming Su
"I have to decide between two equally frightening options.=20
 If I wanted to do that, I'd vote." --Duckman

