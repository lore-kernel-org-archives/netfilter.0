From: Ibrahim Sulaiman <isukity@gmail.com>
Subject: Error when adding iptables MARK rules from my C code using the iptc library
Date: Mon, 26 May 2014 17:30:05 +0100
Message-ID: <CAARRidpT7CRnkSuaPAwLo9Kr2j8zToMKnugh3hHuWUrFCr0PEw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:cc:content-type;
        bh=TFF67o83xO6x0UTdbNQXsLJT3KsWjl/Tgnz+oXyqV1g=;
        b=xWJuCrHbBj1DuOe3rhDFpJxn8BpwWM3XLtnzSGCmJLnkL0qaSHd4K+7easyXHZx5g6
         Tn/BV1vMJ/JdGDBWEoeLG2RQhSH5S1RZkNt3+x/idoty+mN+tqAn7ZBVPdcAPysIqtXN
         H0/e9cn5kSl6QPAVvH2iqfGbrXSNEy38vPPjLSV25XqNRcX5YOABdFZKkUY9YnHYW4oz
         L0ppCFyF2EIxVYtVlHXKCqxLINRPUpMGw6yTn7Yua/+7SoxLCDkWw0lsmEl2bx+bgDqT
         votRAwepZjeo1LgdB9Xos76JJeWtfgWWuyDBYaj4NZzFwNjjaO/5BysJboFc+FZ2EeP2
         pP3g==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter <netfilter@vger.kernel.org>
Cc: "Edwards, Christopher" <c.edwards@lancaster.ac.uk>

Hello,

The C code below is equivalent to the following iptables command:

ip6tables -A OUTPUT -t mangle -s 2001:db8:222:2::/64 -j MARK --set-mark 20

However, the iptables command is working fine from the command line
but when I execute the code it gives the error
Error commit: Protocol wrong type for socket
I have also tried it with setting the DSCP value and it worked fine,
so I guess something wrong with the MARK module

It was suggested that I add this line
target->u.user.revision = 2;
but I had the following error:
Error commit: Invalid argument

Linux kernel 3.8.2
iptables version 1.4.12 (I also tried 1.4.21 but didn't work)


The code

struct ip6tc_handle *h;
const ip6t_chainlabel chain = "OUTPUT";
const char *tablename = "mangle";

struct ip6t_entry * e;
struct ip6t_entry_target * target;
struct xt_mark_tginfo2 *pmark;
unsigned int size_ip6t_entry, size_ip6t_entry_target,  size_pmark, total_length;

size_ip6t_entry = XT_ALIGN(sizeof(struct ip6t_entry));
size_ip6t_entry_target = XT_ALIGN(sizeof(struct ip6t_entry_target));
size_pmark = XT_ALIGN(sizeof(struct xt_mark_tginfo2));

total_length =  size_ip6t_entry +  size_ip6t_entry_target + size_pmark ;

e = calloc(1, total_length);
if(e == NULL)
{
        printf("malloc failure");
        exit(1);
}

//offsets to the other bits:
//target struct begining
e->target_offset = size_ip6t_entry ;
//next "e" struct, end of the current one
e->next_offset = total_length;

char *temps = malloc(128);
temps = "2001:db8:222:2::";
inet_pton(AF_INET6, temps, &e->ipv6.src);
char *temps2 = malloc(128);
temps2 = "FFFF:FFFF:FFFF:FFFF::";
inet_pton(AF_INET6, temps2, &e->ipv6.smsk);
 //e->ipv6.proto = 58 ;
//strcpy(e->ipv6.iniface, "wlan1");

//target struct
target = (struct ip6t_entry_target *) e->elems;
target->u.target_size = size_ip6t_entry_target;
strcpy(target->u.user.name, "MARK");

 pmark = (struct xt_mark_tginfo2 *) target->data;
 pmark->mark = 0x14;
 pmark->mask = 0xff;

h = ip6tc_init(tablename);
if ( !h )
{
      printf("Error initializing: %s\n", iptc_strerror(errno));
      exit(errno);
}

 int x = ip6tc_append_entry(chain, e, h);

if (!x)
{
        printf("Error append_entry: %s\n", iptc_strerror(errno));
        exit(errno);
}
printf("%s", target->data);

int y = ip6tc_commit(h);
if (!y)
{
        printf("Error commit: %s\n", iptc_strerror(errno));
        exit(errno);
}

exit(0);


Any ideas?
Thanks


Best wishes
Ibrahim
