From: Jason Opperisano <opie@817west.com>
Subject: Re: Two NICS with same IP and same client IP
Date: Wed, 02 Feb 2005 09:12:16 -0500
Message-ID: <1107352680.4916.8.camel@hubcap.ljm.dom>
References: <61246.57.66.65.39.1107336931.squirrel@57.66.65.39>
	<4200A1F3.8030609@imag.fr>
	<5172.57.66.65.39.1107338261.squirrel@57.66.65.39>
	<4200AB33.1010308@imag.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <4200AB33.1010308@imag.fr>
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

On Wed, 2005-02-02 at 05:28, Raphael Jacquot wrote:
> Herv=C3=A9 wrote:
> >>having 2 interfaces on the same box with the same IP address
> >>
> >>repeat after me :
> >>
> >>WILL NOT WORK
> >=20
> >=20
> > Well, I can't see why not. Can you explain?

maybe this is easier to grasp:

  $ cd /var/tmp
  $ mkdir new
  $ mkdir new
  mkdir: cannot create directory `new': File exists

you're trying to do the same thing in the kernel.

-j

--
"Dear Mr. President, there are too many states nowadays, please
 eliminate three. I am not a crackpot."
	--The Simpsons


