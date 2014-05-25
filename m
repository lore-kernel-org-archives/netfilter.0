From: Ibrahim Sulaiman <isukity@gmail.com>
Subject: Error when adding iptables from my C code using the iptc library
 "Error commit: Invalid argument"
Date: Sun, 25 May 2014 20:03:29 +0100
Message-ID: <CAARRidoGG2f+XOO=S3_zppcD5mdqF2q2i8eaGCb-Lw6xfcnmog@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:cc:content-type;
        bh=LAv7s9GsNrqRGEhV4MLlXhm60eRGdzMOvZOK+ZZthSY=;
        b=Im/ICA7XCYh1zqLCFd00Uq33lhomzcZc9z+iW3LYA8A2ZWSZzHfM7B3hoyp6hmOq84
         rM07yyhMmN8UpTrmxxzyvgWat1tIU1zW4f4bNlOtLBI/hIyZmBVSyducdIK6jAba5BY1
         upXGi1NehJCcZgRpfyYvSCssiq5T2xa4FJO1zrPXCey1wsenPpxpKWEFi8vCZecZmIj/
         zNM/uv5LYB8iTxkPV6BxTOyd1L9AjMHb1vIlwPkXy7w1CJlmGbDyL2uYqnnexxCIWja8
         DqZ4ciF4bBuNivMEdy9GfPOOSdOqTfH2rVDJ5r7h3V0QaLWJyRuhXrRu1G3nH/fkF7zh
         MPDQ==
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
Error commit: Invalid Argument
although it is compiled successfully. I have also tried it with
setting the DSCP value and it worked fine, so I guess something wrong
with the MARK module

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
target->u.user.revision = 2;

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



Any Idea?
Thanks


Best wishes
Ibrahim
