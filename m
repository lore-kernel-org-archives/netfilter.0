From: Stephane Jourdois <netfilter@rubis.org>
Subject: Modifying Source Ip on input/prerouting
Date: Wed, 11 Dec 2002 14:58:12 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021211135812.GA8394@nath.rubis.org>
Reply-To: stephane@tuxfinder.org
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

Hello all,

I would need to be able to modify the source ip on input GRE paquets.
This is because I'm trying to setup a pptp tunnel, via a router that
doesn't NAT correctly the GRE.
The client receives GRE, but replies with it's own local ip, then my
server cannot receive the answers... If I could just change the source
ip on those paquets, that would be perfect...

Thanks for your help,

--=20
 ///  Stephane Jourdois        	/"\  ASCII RIBBON CAMPAIGN \\\
(((    Ing=E9nieur d=E9veloppement 	\ /    AGAINST HTML MAIL    )))
 \\\   6, av. George V	         X                         ///
  \\\  75008  Paris             / \    +33 6 8643 3085    ///

