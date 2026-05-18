export type Json =
  | string
  | number
  | boolean
  | null
  | { [key: string]: Json | undefined }
  | Json[]

export type Database = {
  // Allows to automatically instantiate createClient with right options
  // instead of createClient<Database, { PostgrestVersion: 'XX' }>(URL, KEY)
  __InternalSupabase: {
    PostgrestVersion: "14.5"
  }
  graphql_public: {
    Tables: {
      [_ in never]: never
    }
    Views: {
      [_ in never]: never
    }
    Functions: {
      graphql: {
        Args: {
          extensions?: Json
          operationName?: string
          query?: string
          variables?: Json
        }
        Returns: Json
      }
    }
    Enums: {
      [_ in never]: never
    }
    CompositeTypes: {
      [_ in never]: never
    }
  }
  public: {
    Tables: {
      appliance_parts: {
        Row: {
          appliance_id: string
          created_at: string
          fitment_note: string | null
          part_id: string
        }
        Insert: {
          appliance_id: string
          created_at?: string
          fitment_note?: string | null
          part_id: string
        }
        Update: {
          appliance_id?: string
          created_at?: string
          fitment_note?: string | null
          part_id?: string
        }
        Relationships: [
          {
            foreignKeyName: "appliance_parts_appliance_id_fkey"
            columns: ["appliance_id"]
            isOneToOne: false
            referencedRelation: "appliances"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "appliance_parts_part_id_fkey"
            columns: ["part_id"]
            isOneToOne: false
            referencedRelation: "parts"
            referencedColumns: ["id"]
          },
        ]
      }
      appliances: {
        Row: {
          category: Database["public"]["Enums"]["appliance_category"]
          created_at: string
          id: string
          image_url: string | null
          is_verified: boolean
          manufacturer: string
          model_name: string | null
          model_number: string
          notes: string | null
          parts_retention_until: number | null
          production_end_year: number | null
          release_year: number | null
        }
        Insert: {
          category: Database["public"]["Enums"]["appliance_category"]
          created_at?: string
          id?: string
          image_url?: string | null
          is_verified?: boolean
          manufacturer: string
          model_name?: string | null
          model_number: string
          notes?: string | null
          parts_retention_until?: number | null
          production_end_year?: number | null
          release_year?: number | null
        }
        Update: {
          category?: Database["public"]["Enums"]["appliance_category"]
          created_at?: string
          id?: string
          image_url?: string | null
          is_verified?: boolean
          manufacturer?: string
          model_name?: string | null
          model_number?: string
          notes?: string | null
          parts_retention_until?: number | null
          production_end_year?: number | null
          release_year?: number | null
        }
        Relationships: []
      }
      favorites: {
        Row: {
          appliance_id: string
          created_at: string
          nickname: string | null
          purchased_at: string | null
          user_id: string
        }
        Insert: {
          appliance_id: string
          created_at?: string
          nickname?: string | null
          purchased_at?: string | null
          user_id: string
        }
        Update: {
          appliance_id?: string
          created_at?: string
          nickname?: string | null
          purchased_at?: string | null
          user_id?: string
        }
        Relationships: [
          {
            foreignKeyName: "favorites_appliance_id_fkey"
            columns: ["appliance_id"]
            isOneToOne: false
            referencedRelation: "appliances"
            referencedColumns: ["id"]
          },
        ]
      }
      listings: {
        Row: {
          affiliate_url: string | null
          fetched_at: string
          id: string
          in_stock: boolean | null
          part_id: string
          price_jpy: number | null
          shop_name: string | null
          source: Database["public"]["Enums"]["listing_source"]
          title: string
          url: string
        }
        Insert: {
          affiliate_url?: string | null
          fetched_at?: string
          id?: string
          in_stock?: boolean | null
          part_id: string
          price_jpy?: number | null
          shop_name?: string | null
          source: Database["public"]["Enums"]["listing_source"]
          title: string
          url: string
        }
        Update: {
          affiliate_url?: string | null
          fetched_at?: string
          id?: string
          in_stock?: boolean | null
          part_id?: string
          price_jpy?: number | null
          shop_name?: string | null
          source?: Database["public"]["Enums"]["listing_source"]
          title?: string
          url?: string
        }
        Relationships: [
          {
            foreignKeyName: "listings_part_id_fkey"
            columns: ["part_id"]
            isOneToOne: false
            referencedRelation: "parts"
            referencedColumns: ["id"]
          },
        ]
      }
      notifications: {
        Row: {
          appliance_id: string | null
          body: string | null
          created_at: string
          id: string
          kind: Database["public"]["Enums"]["notification_kind"]
          read_at: string | null
          title: string
          url: string | null
          user_id: string
        }
        Insert: {
          appliance_id?: string | null
          body?: string | null
          created_at?: string
          id?: string
          kind: Database["public"]["Enums"]["notification_kind"]
          read_at?: string | null
          title: string
          url?: string | null
          user_id: string
        }
        Update: {
          appliance_id?: string | null
          body?: string | null
          created_at?: string
          id?: string
          kind?: Database["public"]["Enums"]["notification_kind"]
          read_at?: string | null
          title?: string
          url?: string | null
          user_id?: string
        }
        Relationships: [
          {
            foreignKeyName: "notifications_appliance_id_fkey"
            columns: ["appliance_id"]
            isOneToOne: false
            referencedRelation: "appliances"
            referencedColumns: ["id"]
          },
        ]
      }
      parts: {
        Row: {
          category: Database["public"]["Enums"]["part_category"]
          created_at: string
          description: string | null
          id: string
          image_url: string | null
          kind: Database["public"]["Enums"]["part_kind"]
          manufacturer: string | null
          manufacturer_part_number: string | null
          name: string
        }
        Insert: {
          category: Database["public"]["Enums"]["part_category"]
          created_at?: string
          description?: string | null
          id?: string
          image_url?: string | null
          kind?: Database["public"]["Enums"]["part_kind"]
          manufacturer?: string | null
          manufacturer_part_number?: string | null
          name: string
        }
        Update: {
          category?: Database["public"]["Enums"]["part_category"]
          created_at?: string
          description?: string | null
          id?: string
          image_url?: string | null
          kind?: Database["public"]["Enums"]["part_kind"]
          manufacturer?: string | null
          manufacturer_part_number?: string | null
          name?: string
        }
        Relationships: []
      }
      reviews: {
        Row: {
          appliance_id: string | null
          body: string
          created_at: string
          id: string
          part_id: string | null
          rating: number | null
          target: Database["public"]["Enums"]["review_target"]
          updated_at: string
          user_id: string
        }
        Insert: {
          appliance_id?: string | null
          body: string
          created_at?: string
          id?: string
          part_id?: string | null
          rating?: number | null
          target: Database["public"]["Enums"]["review_target"]
          updated_at?: string
          user_id: string
        }
        Update: {
          appliance_id?: string | null
          body?: string
          created_at?: string
          id?: string
          part_id?: string | null
          rating?: number | null
          target?: Database["public"]["Enums"]["review_target"]
          updated_at?: string
          user_id?: string
        }
        Relationships: [
          {
            foreignKeyName: "reviews_appliance_id_fkey"
            columns: ["appliance_id"]
            isOneToOne: false
            referencedRelation: "appliances"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "reviews_part_id_fkey"
            columns: ["part_id"]
            isOneToOne: false
            referencedRelation: "parts"
            referencedColumns: ["id"]
          },
        ]
      }
    }
    Views: {
      [_ in never]: never
    }
    Functions: {
      [_ in never]: never
    }
    Enums: {
      appliance_category:
        | "rice_cooker"
        | "washing_machine"
        | "vacuum"
        | "air_conditioner"
        | "microwave"
        | "other"
        | "refrigerator"
      listing_source: "rakuten" | "amazon" | "yahoo" | "manufacturer"
      notification_kind: "eol_warning" | "eol_expired" | "price_drop"
      part_category:
        | "inner_pot"
        | "filter"
        | "remote"
        | "battery"
        | "bag"
        | "brush"
        | "belt"
        | "gasket"
        | "other"
        | "turntable"
        | "ice_tray"
      part_kind: "oem" | "compatible"
      review_target: "part" | "appliance"
    }
    CompositeTypes: {
      [_ in never]: never
    }
  }
}

type DatabaseWithoutInternals = Omit<Database, "__InternalSupabase">

type DefaultSchema = DatabaseWithoutInternals[Extract<keyof Database, "public">]

export type Tables<
  DefaultSchemaTableNameOrOptions extends
    | keyof (DefaultSchema["Tables"] & DefaultSchema["Views"])
    | { schema: keyof DatabaseWithoutInternals },
  TableName extends DefaultSchemaTableNameOrOptions extends {
    schema: keyof DatabaseWithoutInternals
  }
    ? keyof (DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Tables"] &
        DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Views"])
    : never = never,
> = DefaultSchemaTableNameOrOptions extends {
  schema: keyof DatabaseWithoutInternals
}
  ? (DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Tables"] &
      DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Views"])[TableName] extends {
      Row: infer R
    }
    ? R
    : never
  : DefaultSchemaTableNameOrOptions extends keyof (DefaultSchema["Tables"] &
        DefaultSchema["Views"])
    ? (DefaultSchema["Tables"] &
        DefaultSchema["Views"])[DefaultSchemaTableNameOrOptions] extends {
        Row: infer R
      }
      ? R
      : never
    : never

export type TablesInsert<
  DefaultSchemaTableNameOrOptions extends
    | keyof DefaultSchema["Tables"]
    | { schema: keyof DatabaseWithoutInternals },
  TableName extends DefaultSchemaTableNameOrOptions extends {
    schema: keyof DatabaseWithoutInternals
  }
    ? keyof DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Tables"]
    : never = never,
> = DefaultSchemaTableNameOrOptions extends {
  schema: keyof DatabaseWithoutInternals
}
  ? DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Tables"][TableName] extends {
      Insert: infer I
    }
    ? I
    : never
  : DefaultSchemaTableNameOrOptions extends keyof DefaultSchema["Tables"]
    ? DefaultSchema["Tables"][DefaultSchemaTableNameOrOptions] extends {
        Insert: infer I
      }
      ? I
      : never
    : never

export type TablesUpdate<
  DefaultSchemaTableNameOrOptions extends
    | keyof DefaultSchema["Tables"]
    | { schema: keyof DatabaseWithoutInternals },
  TableName extends DefaultSchemaTableNameOrOptions extends {
    schema: keyof DatabaseWithoutInternals
  }
    ? keyof DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Tables"]
    : never = never,
> = DefaultSchemaTableNameOrOptions extends {
  schema: keyof DatabaseWithoutInternals
}
  ? DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Tables"][TableName] extends {
      Update: infer U
    }
    ? U
    : never
  : DefaultSchemaTableNameOrOptions extends keyof DefaultSchema["Tables"]
    ? DefaultSchema["Tables"][DefaultSchemaTableNameOrOptions] extends {
        Update: infer U
      }
      ? U
      : never
    : never

export type Enums<
  DefaultSchemaEnumNameOrOptions extends
    | keyof DefaultSchema["Enums"]
    | { schema: keyof DatabaseWithoutInternals },
  EnumName extends DefaultSchemaEnumNameOrOptions extends {
    schema: keyof DatabaseWithoutInternals
  }
    ? keyof DatabaseWithoutInternals[DefaultSchemaEnumNameOrOptions["schema"]]["Enums"]
    : never = never,
> = DefaultSchemaEnumNameOrOptions extends {
  schema: keyof DatabaseWithoutInternals
}
  ? DatabaseWithoutInternals[DefaultSchemaEnumNameOrOptions["schema"]]["Enums"][EnumName]
  : DefaultSchemaEnumNameOrOptions extends keyof DefaultSchema["Enums"]
    ? DefaultSchema["Enums"][DefaultSchemaEnumNameOrOptions]
    : never

export type CompositeTypes<
  PublicCompositeTypeNameOrOptions extends
    | keyof DefaultSchema["CompositeTypes"]
    | { schema: keyof DatabaseWithoutInternals },
  CompositeTypeName extends PublicCompositeTypeNameOrOptions extends {
    schema: keyof DatabaseWithoutInternals
  }
    ? keyof DatabaseWithoutInternals[PublicCompositeTypeNameOrOptions["schema"]]["CompositeTypes"]
    : never = never,
> = PublicCompositeTypeNameOrOptions extends {
  schema: keyof DatabaseWithoutInternals
}
  ? DatabaseWithoutInternals[PublicCompositeTypeNameOrOptions["schema"]]["CompositeTypes"][CompositeTypeName]
  : PublicCompositeTypeNameOrOptions extends keyof DefaultSchema["CompositeTypes"]
    ? DefaultSchema["CompositeTypes"][PublicCompositeTypeNameOrOptions]
    : never

export const Constants = {
  graphql_public: {
    Enums: {},
  },
  public: {
    Enums: {
      appliance_category: [
        "rice_cooker",
        "washing_machine",
        "vacuum",
        "air_conditioner",
        "microwave",
        "other",
        "refrigerator",
      ],
      listing_source: ["rakuten", "amazon", "yahoo", "manufacturer"],
      notification_kind: ["eol_warning", "eol_expired", "price_drop"],
      part_category: [
        "inner_pot",
        "filter",
        "remote",
        "battery",
        "bag",
        "brush",
        "belt",
        "gasket",
        "other",
        "turntable",
        "ice_tray",
      ],
      part_kind: ["oem", "compatible"],
      review_target: ["part", "appliance"],
    },
  },
} as const
