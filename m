From: Mr Dash Four <mr.dash.four@googlemail.com>
Subject: Re: ipset v6.latest bugs?
Date: Tue, 26 Apr 2011 01:38:40 +0100
Message-ID: <4DB61410.4070202@googlemail.com>
References: <4DB5614C.3040808@googlemail.com> <alpine.DEB.2.00.1104252144230.31185@blackhole.kfki.hu> <4DB5DB3A.8000708@googlemail.com> <alpine.DEB.2.00.1104252248090.31417@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------040808040109010806030606"
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:message-id:disposition-notification-to:date
         :from:user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type;
        bh=YZsOZv6kUo7PTFFypmrMcWF31p04JdP+2iqzvlYOt/I=;
        b=Uyw8h5AiUgZOrJpn1PIxENz8zMxC1DuutRpfWspunpnNU2dsa4JTKQ0MGjShYUK/Ja
         4WKea+ARLXVWV1TQqq4CJQp2lBwRJU8m8kQsf/dpNlvaeryqOHMO1PuMyTW2Rbc5h2s3
         rkx/b/gv6HdxjDpRhvqhJleFK6k6mpDothJfs=
In-Reply-To: <alpine.DEB.2.00.1104252248090.31417@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

This is a multi-part message in MIME format.
--------------040808040109010806030606
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


>> Yeah, but the set is empty!
>>
>> It is flushed, so why is it that after the set is cleared (and there are no
>> elements in that set!), it still occupies 4 times as much memory it had
>> initially with the same number of elements, i.e. zero? If this isn't a memory
>> leak it is a very bad practice I would think.
>>     
>
> Hashes are never shrunk. The hash was initiated with the size 1024. Then 
> it was doubled, again and again. Even after deleting all the elements, the 
> base structures are there, emptied, ready to occupy new elements.
>   
Right! OK, I just realised that the has value has grown as well, thus 
increasing the memory footprint, which is fair enough i suppose. I also 
assumed that the hash value could double up indefinitely until the 
maxelem is reached, but that turned out not to be the case - the hash 
value doubled up just once:
[root@test1 ~]# ipset -N test hash:ip maxelem 262144
[root@test1 ~]# ipset -A test 10.4.0.0-10.7.255.255
ipset v6.4: Element cannot be added to the set: it's already added
[root@test1 ~]# ipset -F test
[root@test1 ~]# ipset -L test
Name: test
Type: hash:ip
Header: family inet hashsize 2048 maxelem 262144
Size in memory: 32896
References: 0
Members:
[root@test1 ~]#

Is this intentional?

Performing the same set of statements as in my initial post, but with 
maxelem 262144 (the number of ip addresses in that range) as well as 
hashsize set to the same number produces no errors and after "flush" the 
hash set uses the same memory footprint as when there were no elements 
stored there.

> If you don't need a large set anymore, swap it with a smaller one.
>   
What happens if this set is used in iptables statements, would this work?

> The problem is that at some point the conversion has to be done.
> It can be done before feeding the data to ipset too. 
>   
So you think it is a good idea for everybody out there using  ipset to 
get some sort of conversion utility so that hash:net is utilised in that 
manner then?

Wouldn't it be better if you could adapt ipset and make it behave the 
same way as it currently does with hash:ip type set in terms of 
specifying members? The same way as you did with specifying port ranges 
as well, not to mention that in versions 4+ that used to also be the 
case. The hash:net type set is the only exception in the whole range of 
sets on offer!

> hash:net and iptreemap are quite different. Let's look at 10.1.0.0/16: 
> with hash:net that is a single element, interpreted as a network and 
> matching all elements in it. In iptreemap, that's 65536 different, 
> individual IP addresses.
>   
ipset -L on a iptreemap type set tells different - it contains a single 
element - 10.1.0.0/16 - and that's it! It is even better because I could 
use both forms - cidr and ranges alike - and it shows me the ip address 
ranges when I list the actual set. In that respect iptreemap's 
implementation is much better than what currently exists with hash:net 
set in 6.4!

> Convert the ranges to networks and use a hash:net type of set. There are 
> countless tools to do the conversion.
There may be, but that isn't the point - do I have to arm myself with 
yet another tool, which would make my job that bit more complicated and 
difficult (not to mention the time I have to spend adapting to this as 
well as further maintaining it!), compared to if I had ipset implemented 
in such a way, that it is flexible enough to accept IP ranges as well as 
those listed with cidr notation - a flexibility which already existed in 
version 4 of the same tool?

> I see that automatic input 
> conversion could be a useful feature in ipset but at least for a few weeks 
> I'll not be able to deal with it.
>   
I am attaching something to this email (though I am not sure whether 
this would be accepted by the mail list daemon!) to get you started if 
you so desire.


--------------040808040109010806030606
Content-Type: text/plain;
 name="cidr.c"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="cidr.c"

#include <stdio.h>
#include <unistd.h>
#include <string.h>
#include <math.h>
#include <errno.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>

#define IP_BINARY_LENGTH 32+1  /* 32 bits ipv4 address +1 for null */
#define IP_HEX_LENGTH    10   
#define MAX_CIDR_MASK    32
#define MAX_CIDR_LEN     18+1   /* 255.255.255.255/32 */

void rangeToCidr(uint32_t from ,uint32_t to,
                 void (callback)(char *cidrNotation));
int ipToBin(uint32_t ip , char * pOut);

void printNotation(char *cidrNotation);

/*******************************************************************************
*
* ipToBin - convert an ipv4 address to binary representation 
*           and pads zeros to the beginning of the string if 
*           the length is not 32 
*           (Important for ranges like 10.10.0.1 - 20.20.20.20 )
*
* ip   - ipv4 address on host order
* pOut - Buffer to store binary.
*
* RETURNS: OK or ERROR 
*/

int ipToBin(uint32_t ip , char * pOut) {
    char hex[IP_HEX_LENGTH];
    int i;
    int result=0;
    int len;
    char pTmp[2];
    int tmp;
    /*
     * XXX: Could use bit operations instead but was easier to debug
     */
    char binMap[16][5] = { 
                          "0000","0001","0010","0011", "0100",
                          "0101","0110","0111","1000", "1001",
                          "1010","1011","1100", "1101","1110","1111",
                         };
    pTmp[1]=0x0;
    memset(hex,0x0,sizeof(hex));
    len=sprintf(hex,"%x",ip);

    for(i=0;i<len;i++) {

        /* Ugly but to use strtol , we need the last byte as null */
        pTmp[0]=hex[i];
        errno = 0;
        tmp = strtol(pTmp, 0x0, 16);

        /* Should not happen */
        if (errno != 0) {
            memset(pOut,'0',IP_BINARY_LENGTH -1);
            return -1;
        }
        result+=sprintf(pOut+result,"%s",binMap[tmp]);
    }

    /* if length is not 32 , pad the start with zeros*/
    if(result < IP_BINARY_LENGTH-1) {
        char pSwap[IP_BINARY_LENGTH];
        strncpy(pSwap,pOut,IP_BINARY_LENGTH);
        memset(pOut,'0',IP_BINARY_LENGTH);
        strncpy(pOut+IP_BINARY_LENGTH-1-result,pSwap,result);
    } else if (result > IP_BINARY_LENGTH-1)
        return -1;

    /* Success */
    return 0;
}

/*******************************************************************************
*  main : 
* 
*  arg1 : Start IP Address
*  arg2 : End IP address
*/

int main (int argc,char **argv) {
    long fromIp, toIp;
    struct in_addr addr;
    if (argc !=3 ) {
        printf("Usage: %s <from> <to>\n",argv[0]);
        return(0);
    }

    /* All operation on host order */   
    if (inet_aton(argv[1],&addr) == 0)
        goto error;
    fromIp = ntohl(addr.s_addr);

    if (inet_aton(argv[2],&addr) ==0)
        goto error;
    toIp = ntohl(addr.s_addr);

    rangeToCidr(fromIp,toIp,printNotation);

    return 0;
error:
    printf("Invalid Argument\n");
    return -EINVAL;
}


/*******************************************************************************
*
* rangeToCidr - convert an ip Range to CIDR, and call 'callback' to handle
*               the value. 
*
* from     - IP Range start address
* to       - IP Range end address
* callback - Callback function to handle cidr.
* RETURNS: OK or ERROR 
*/

void rangeToCidr(uint32_t from ,uint32_t to,
                 void (callback)(char *cidrNotation)) {
    int     cidrStart = 0;
    int     cidrEnd = MAX_CIDR_MASK - 1;
    long    newfrom;
    long    mask;
    char    fromIp[IP_BINARY_LENGTH];
    char    toIp[IP_BINARY_LENGTH];
    struct  in_addr addr;
    char    cidrNotation[MAX_CIDR_LEN];

    memset (fromIp,0x0,sizeof(fromIp));
    memset (toIp,0x0,sizeof(toIp));

    if ( ipToBin(from,fromIp) != 0 ) 
        return;
    if ( ipToBin(to,toIp) != 0 )
        return;

    if(from < to ) {

        /* Compare the from and to address ranges to get the first
         * point of difference
         */
        while(fromIp[cidrStart]==toIp[cidrStart])
            cidrStart ++;
        cidrStart = 32 - cidrStart -1 ;

        /* Starting from the found point of difference make all bits on the 
         * right side zero 
         */
        newfrom = from >> cidrStart +1  << cidrStart +1;        

        /* Starting from the end iterate reverse direction to find 
         * cidrEnd
         */ 
        while( fromIp[cidrEnd] == '0' && toIp[cidrEnd] == '1')
            cidrEnd --;

        cidrEnd = MAX_CIDR_MASK - 1 - cidrEnd;

        if(cidrEnd <= cidrStart) {
            /* 
             * Make all the bit-shifted bits equal to 1, for
             * iteration # 1.
             */
            mask = pow (2, cidrStart ) - 1;
            rangeToCidr (from , newfrom | mask, callback);
            rangeToCidr (newfrom | 1 <<  cidrStart ,to ,callback);
        } else {
            addr.s_addr = htonl(newfrom);
            sprintf(cidrNotation,"%s/%d", 
                    inet_ntoa(addr), MAX_CIDR_MASK-cidrEnd);
            if (callback != NULL)
                callback(cidrNotation);
        }
    } else {
        addr.s_addr = htonl(from);
        sprintf(cidrNotation,"%s/%d",inet_ntoa(addr),MAX_CIDR_MASK);
        if(callback != NULL)
            callback(cidrNotation);
    }
}

/*******************************************************************************
*
* printNotation - This is an example callback function to handle cidr notation. 
*
* RETURNS:
*/

void printNotation(char *cidrNotation) {
    printf("%s\n",cidrNotation);
}

--------------040808040109010806030606--
