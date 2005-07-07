From: Francesco Ciocchetti <primero@fastwebnet.it>
Subject: Developing with libiptc ... little problem with matches
Date: Thu, 07 Jul 2005 18:43:38 +0200
Message-ID: <42CD5BBA.6070800@fastwebnet.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi all ML.

I'm coding a little apps , just for fun , that uses libiptc API to
interact with Netfilter.

I'm writing now my functions to insert new rules in netfilter tables but
i'm experiencing a problem i've not been able to solve by myself yet.

i've got a structure that represents my firewall rule , it is a very
simple structure derived from libdnet:

 struct fw_rule {
             char            fw_device[INTF_NAME_LEN]; /* interface name
NOTE device=chain!!!!!*/
             uint8_t         fw_op;                    /* operation
ALLOW/BLOCK*/
             uint8_t         fw_dir;                   /* direction
USELESS REMOVED!!!!!!*/
             uint8_t         fw_proto;                 /* IP protocol */
             struct addr     fw_src;                   /* src address /
net */
             struct addr     fw_dst;                   /* dst address /
net */
             uint16_t        fw_sport[2];              /* range / ICMP
type */
             uint16_t        fw_dport[2];              /* range / ICMP
code */
              };



i'm in a big trouble while tryng to convert my rule to an ipt_entry
struct when i arrive to create the 'match structure'.

here is a part of my code:

        /*tcp udp Match*/
        pr=getprotobynumber(fr->fw_proto);
        if ((pr->p_proto==IP_PROTO_TCP)||(pr->p_proto==IP_PROTO_UDP))
        {
                size_t size;
                char * port_string;

                m=find_match(pr->p_name,TRY_LOAD,&matches);
                if (m)
                        printf("%i",m->size);
               else
                        printf("CAZZO");
                size = IPT_ALIGN(sizeof(struct ipt_entry_match))+m->size;

              if ((m->m = calloc(1, size))==NULL)
              {
                      fprintf(stderr,"iptables:calloc failed");
                      exit(1);
              }

              m->m->u.match_size = size;
              strcpy(m->m->u.user.name, m->name);
              m->init(m->m,&e->nfcache);

                /*sport (1)*/
              if (fr->fw_sport[0]==fr->fw_sport[1])
                      strcpy(port_string,(char *)&fr->fw_sport[0]);
              else
              {
                      strcat(port_string,(char *)&fr->fw_sport[0]);
                      strcat(port_string,":");
                      strcat(port_string,(char *)&fr->fw_sport[1]);
              }

              for (matchp=matches;matchp;matchp=matchp->next)
              {
                     
if(matchp->match->parse(1,&port_string,(int)NULL,&matchp->match->mflags,e,&e->nfcache,&matchp->match->m))
                              break;
              }
              m = matchp ? matchp->match : NULL;

                /*dport (2)*/
              if (fr->fw_dport[0]==fr->fw_dport[1])
                      strcpy(port_string,(char *)&fr->fw_dport[0]);
              else
              {
                      strcat(port_string,(char *)&fr->fw_dport[0]);
                      strcat(port_string,":");
                      strcat(port_string,(char *)&fr->fw_dport[1]);
              }

              for (matchp=matches;matchp;matchp=matchp->next)
              {
                     
if(matchp->match->parse(2,&port_string,(int)NULL,&matchp->match->mflags,e,&e->nfcache,&matchp->match->m))
                              break;
              }
              m = matchp ? matchp->match : NULL;

              for (matchp=matches;matchp;matchp=matchp->next)
                      matchp->match->final_check(matchp->match->mflags);


       }



my problem resides here:   m=find_match(pr->p_name,TRY_LOAD,&matches);

when the program reach this instruction i get a not so nice Segmentation
Fault. So i started to try to understand what was happening, i copied
"find_match" function from itpables.c to my program and what i
discovered is that


        for (ptr = iptables_matches; ptr; ptr = ptr->next) {
                if (strcmp(name, ptr->name) == 0)
                        break;
        }

i get no "ptr"  ... i think i should register or init the "iptables
extensions" at start of my program to populate the linked list referred
by iptables_matches , but i really don't know how to do it.
Then i think that even passing the TRY_LOAD arg the extensions are maybe
not loaded ... how should i do such a thing?



I hope i've been clear and gave enough infos.

Any help will be REALLY REALLY appreciated :)

Bye
Francesco


I'm sorry for both my english and my code ... none of them are my
'Natural Language' ;)


