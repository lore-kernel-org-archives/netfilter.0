From: ratheesh k <ratheesh.ksz@gmail.com>
Subject: order of HOOK functions
Date: Tue, 23 Mar 2010 21:41:01 +0530
Message-ID: <cfeab66d1003230911q931ed69od7d0d38b013a175b@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type;
        bh=ZHpjZaklIRfwY/d1En40dfLSY6IBiqX1mRzk2Y3vw7Y=;
        b=IvIe22wKlSq0X9P1UUv0tQ9BXh/GEKYeALwfUV++83oxZrAmqB272SeMqGWNE79xVq
         TXPo47p0xYnGeySemI0JVwCCRAcOxCpWV5iQXCrzOKKUYP1tf65BBKViJRwwgsF69i5f
         bWz2JWWmfdgqJTPMEGfl9HHOiLFGD/PhaDCr0=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

I have a rule

R1------>  iptables -A FORWARD  -j ACCEPT  -

After applying  the above rule , i executed the below program


********************************************************************************************************
/* copied from http://sts.synflood.de/dump/doc/p61-0x0d_Hacking_the_Linux_Kernel_Network_Stack.txt
*/


   /* Initialisation routine */
          int init_module()
          {
              /* Fill in our hook structure */
              nfho.hook     = hook_func;
              /* Handler function */
              nfho.hooknum  = NF_IP_PRE_ROUTING; /* First for IPv4 */
              nfho.pf       = PF_INET;
              nfho.priority = NF_IP_PRI_FIRST;   /* Make our func first */

              nf_register_hook(&nfho);

              return 0;
          }

/* This is the hook function itself */
unsigned int hook_func(unsigned int hooknum,
                       struct sk_buff **skb,
                       const struct net_device *in,
                       const struct net_device *out,
                       int (*okfn)(struct sk_buff *))
{
    return NF_DROP;           /* Drop ALL packets */
}

******************************************************************************************************************************
I executed below rule - R2   .

R2   --- > iptables  -I  FORWARD -j REJECT .


Question : to which target is chosen ( DROP or REJECT or ACCEPT ) . {
order of hook function ?? }

Thanks,
RAtheesh
