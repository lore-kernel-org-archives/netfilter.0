From: "Nathan Cassano" <nathan@cjhunter.com>
Subject: RE: Additional user for iptables
Date: Fri, 21 Jun 2002 13:50:09 -0700
Sender: netfilter-admin@lists.samba.org
Message-ID: <007001c21965$3b4cdec0$2901a8c0@amos>
References: <MBBBJHGKAGOKDNNIMPJHMEPKJGAA.davemiller@comcast.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <MBBBJHGKAGOKDNNIMPJHMEPKJGAA.davemiller@comcast.net>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: 'Dave Miller' <davemiller@comcast.net>, netfilter@lists.samba.org



Dave Miller wrote:
>
>Hello - 
>
> Is there a way to allow an additional (non root) user to access the
iptables tool without using sudo or similar?

Hi Dave,
	What are you trying to accomplish? What specific parts of
iptables do you want your users to access?

In any case if you are bent on letting your users access iptables I
would develop a suid c program that only accepts specific iptables
manipulations (i.e. only blocking an ip address) and runs the iptables
program. Heavily check the program's arguments so that nothing gets
through but allowed data. Make sure that only designated users will have
the permissions to executer this suid program.


Nathan



