From: Igor de Paula <igordptx@gmail.com>
Subject: Help use parsing to get a promiscuous level
Date: Thu, 25 May 2023 15:13:21 +0100
Message-ID: <CALDr01S8DJsLFVyFRmVPdqeLe=-sLCrS2zsFdF_8YL_0BBF2VQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685024012; x=1687616012;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SrtiA9Yx/kitfabmQBREjv0jdt4C0J2+kwH8RPyMXts=;
        b=BMHq7JFQ6HHSGnw8GzgCz8uat6rb46VjyMKottR6Luo4kAzLHTiH8NnNi4yc6gqPJG
         PrB0S4YKr5AW6D4wacM/tQwo8OkqsksdrsF3dD15zQREVWJ5og+9A3HO4zeHz7epgYnY
         5Ic0czbYuFSB+lp8H0sCYZKNzv8Z3X3SiBobiYBAPGU9ENrGDbD+Jk4vajox5cTwRCBk
         hiMgWyM8N+JfwsY+auRNatnCwywWfNSHCQs+5mAO+uIBsio3kpeBUDB9sbkE52rObgo2
         ufmPPHcGE7mlNDaKfq3ScbvU+PGlN2xcQjdkdNwPGbHk/LlZ1Dp6mbhpUmjRDtKBvKCT
         DWsg==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Sorry for the spam but this is clearer I think,
Hi,
I have a DPDK application holding some ports, and I want to have a
virtio_user port to interface with the kernel stack, For example, I
want to use tcpdump on a virtual interface. So I understand I need to
create a netlink listener which I did. And using some print statements
I am getting a packet on the netlink port when I try to use tcpdump on
the virtual interface.
My problem is that I can't figure out how to parse the packet. For
example I expect that calling TCP dump should trigger a packet to set
a promiscuous flag, and stopping tcpdump should trigger a packet to
disable promiscuous mode.

Currently from the examples this is the attr parser I have:
static int data_attr_cb(const struct nlattr *attr, void *data)
{
const struct nlattr **tb = data;
int type = mnl_attr_get_type(attr);

/* skip unsupported attribute in user-space */
if (mnl_attr_type_valid(attr, IFLA_MAX) < 0)
return MNL_CB_OK;

switch(type) {
case IFLA_MTU:
if (mnl_attr_validate(attr, MNL_TYPE_U32) < 0) {
perror("mnl_attr_validate");
return MNL_CB_ERROR;
}
break;
case IFLA_IFNAME:
if (mnl_attr_validate(attr, MNL_TYPE_STRING) < 0) {
perror("mnl_attr_validate");
return MNL_CB_ERROR;
}
break;
}
tb[type] = attr;
return MNL_CB_OK;
}

But this doesn't give any information. Any help on how to understand
this packet would be appreciated. I thought as there is a next
attribute and maybe nested attributes if I add the following code:
    while (attr != NULL)
    {
        attr = mnl_attr_next(attr);
        type = mnl_attr_get_type(attr);
        if (type == 0)
            break;
        printf("type: %d\n",type);
    }
I might get to the promiscuous flag (30), but I am printing like 100
of those per packet. And from what I read the payload also has
attributes. This might be a stupid question but any help on
understanding this would be appreciated.
