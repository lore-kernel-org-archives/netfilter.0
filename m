From: Kim Jensen <kimj@dawn.dk>
Subject: Re: mount -t smbfs from firewall to samba
Date: Wed, 26 Mar 2003 14:33:46 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200303261433.46242.kimj@dawn.dk>
References: <B5747F3DB39FD411884B00B0D07808CCB6C9A9@server10>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <B5747F3DB39FD411884B00B0D07808CCB6C9A9@server10>
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
To: "Philippe Dhont   (Sea-ro)" <Philippe.Dhont@searo.be>, netfilter@lists.netfilter.org

On Wednesday 26 March 2003 13:57, Philippe Dhont (Sea-ro) wrote:
> hi,
>
> i am installing a firewall with 2 nic's from 0 and doing some tests rig=
ht
> now.
> I am pretty new but i try, ok :)
> now, my default policy is to drop everything but now i am trying to con=
nect
> via my firewall to a samba server.
> OUTPUT is ok to port 139 of the samba server but then the samba tries o=
f
> course to connect with the firewall and this can be another port every
> time. How do i set this in the policy ?
>
iptables -t filter -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEP=
T

/Kim


