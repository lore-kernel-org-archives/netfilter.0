From: Martijn Lievaart <m@rtij.nl>
Subject: Re: Simple question
Date: Wed, 05 May 2004 19:43:51 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <409927D7.7040705@rtij.nl>
References: <001501c432b5$7a5c5f80$a704a8c0@mpro4167>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <001501c432b5$7a5c5f80$a704a8c0@mpro4167>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?ISO-8859-15?Q?Oriol_Magran=E9?= <omagrane@mediapro.es>
Cc: netfilter@lists.netfilter.org

Oriol Magran=E9 wrote:

>  
>     Hello!
>     Just one question...
>     I have a firewall with the INPUT, OUTPUT and FORWARD policies set 
> to DROP, and now I want to allow connections from localhost to 
> localhost (any port). Which chains are implied here? INPUT? OUTPUT? Bo=
th?
>     How should the needed rule(s) be?
>  


This should do it:
-A INPUT -i lo -j ACCEPT
-A OUTPUT -i lo -j ACCEPT

HTH,
M4



