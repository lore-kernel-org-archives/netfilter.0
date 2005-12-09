From: Georgi Alexandrov <georgi.alexandrov@gmail.com>
Subject: Re: opening port for SSH
Date: Fri, 09 Dec 2005 17:37:48 +0200
Message-ID: <4399A4CC.90909@gmail.com>
References: <dn9dag$je3$1@sea.gmane.org> <43999370.8010504@gmail.com>
	<000f01c5fcce$c2e3aad0$6501a8c0@ludi>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <000f01c5fcce$c2e3aad0$6501a8c0@ludi>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

myhapwcforever wrote:

>And use the public-key ;)
>  
>
And disable version 1 of the protocol.
And disable root logins.
And use AllowGroups and/or AllowUsers in sshd_config.
And use RSA for generating the keys.


P.S.
You mean pub/priv key pair, right?

regards,
Georgi Alexandrov

