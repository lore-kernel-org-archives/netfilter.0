From: "Gautham Thavva" <gautham.thavva@lycos.com>
Subject: Re: TFTP ..unable to track...
Date: Mon, 19 May 2003 13:44:20 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <AIHKKHGMJEJJLAAA@mailcity.com>
Reply-To: gautham.thavva@lycos.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Language: en
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
To: Cedric Blancher <blancher@cartel-securite.fr>
Cc: netfilter@lists.netfilter.org


I did use the *tftp.patch* by Magnus Boden in the patch-o-matic. I tried to track after applying this patch but was not successful.

I understood going through the patch that it will work if the firewall is in place on a machine that is running the tftp server. 

In this case, it is a tftp client on the machine. Is my understanding correct? Please can you suggest another way.

regards,
Gautham



--------- Original Message ---------

DATE: 16 May 2003 08:39:14 +030
From: Cedric Blancher <blancher@cartel-securite.fr>
To: gautham.thavva@lycos.com
Cc: netfilter@lists.netfilter.org

>Le lun 12/05/2003 ` 17:37, Gautham Thavva a icrit :
>> This machine is running a TFTP client. I am unable to track the TFTP
>> sessions.
>
>See patch-o-matic. There's a patch for TFTP conntrack.
>
>-- 
>Cidric Blancher  <blancher@cartel-securite.fr>
>IT systems and networks security - Cartel Sicuriti
>Phone : +33 (0)1 44 06 97 87 - Fax: +33 (0)1 44 06 97 99
>PGP KeyID:157E98EE  FingerPrint:FA62226DA9E72FA8AECAA240008B480E157E98EE
>
>



____________________________________________________________
Get advanced SPAM filtering on Webmail or POP Mail ... Get Lycos Mail!
http://login.mail.lycos.com/r/referral?aid=27005

