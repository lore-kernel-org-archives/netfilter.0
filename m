From: "Richard Gopaul" <rgopaul@umd.edu>
Subject: promiscuous mode w/ hook
Date: Thu, 21 Oct 2004 17:14:02 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1098393242.b373a500rgopaul@umd.edu>
Reply-To: rgopaul@umd.edu
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi, 

I'm trying to put my ethernet interface into promiscuous mode and have all =
traffic sent to the netfilter prerouting hook.  I've read documentation o=
n line and in the source that says that traffic doesn't make it to netfil=
ter until after foreign promiscuous packets are dropped though, which mak=
es me think this will be a bit of a challenge.  Any ideas?  

Thanks, 
Richard ;


